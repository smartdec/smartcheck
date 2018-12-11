package ru.smartdec.smartcheck.app.cli;

import ru.smartdec.smartcheck.RulesCached;
import ru.smartdec.smartcheck.RulesXml;
import ru.smartdec.smartcheck.app.DirectoryAnalysisDefault;
import ru.smartdec.smartcheck.app.ReportDefault;
import ru.smartdec.smartcheck.app.TreeFactoryDefault;

import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.xpath.XPathFactory;
import java.net.URI;
import java.nio.file.FileSystems;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

/**
 *
 */
public final class Tool {

    /**
     * @param args args
     * @throws Exception exception
     */
    public static void main(final String... args) throws Exception {
        Tool.main(new ArgumentsDefault(args));
    }

    /**
     * @param arguments args
     * @throws Exception exception
     */
    public static void main(final Arguments arguments) throws Exception {
        Path src = arguments
                .value("-p", "-path")
                .map(Paths::get)
                .filter(Files::exists)
                .orElseThrow(IllegalArgumentException::new);

        RulesXml.Source defaultRules = () -> {
            URI uri = RulesXml
                    .class
                    .getResource("/rules.xml")
                    .toURI();
            System.out.print(uri);

            // initialize a new ZipFilesystem
            HashMap<String, String> env = new HashMap<>();
            env.put("create", "true");
            FileSystems.newFileSystem(uri, env);

            return Paths.get(uri);
        };

        RulesXml.Source rules = arguments
                .value("-r", "-rules")
                .map(Paths::get)
                .filter(Files::isRegularFile)
                .<RulesXml.Source>map(path -> () -> path)
                .orElseGet(() -> defaultRules);

        new Tool(src, rules).run();
    }

    /**
     *
     */
    private final Path source;
    /**
     *
     */
    private final RulesXml.Source rules;

    /**
     * @param src source
     * @param rs  rules
     */
    public Tool(final Path src, final RulesXml.Source rs) {
        this.source = src;
        this.rules = rs;
    }

    /**
     * @throws Exception exception
     */
    public void run() throws Exception {
        new ReportDefault(
                new DirectoryAnalysisDefault(
                        this.source,
                        new TreeFactoryDefault(
                                DocumentBuilderFactory
                                        .newInstance()
                                        .newDocumentBuilder()
                        ),
                        new RulesCached(
                                new RulesXml(
                                        this.rules,
                                        XPathFactory.newInstance().newXPath(),
                                        Throwable::printStackTrace
                                )
                        )
                ),
                info -> {
                    System.out.println(info.file());
                    Map<String, Integer> result = new HashMap<>();
                    info.treeReport().streamUnchecked().forEach(
                            tree -> tree.contexts().forEach(
                                    context -> {
                                        System.out.printf(
                                                "ruleId: %s%n"
                                                      + "patternId: %s%n"
                                                      + "severity: %d%n"
                                                      + "line: %d%ncolumn: %d%n"
                                                      + "content: %s%n%n",
                                                tree.rule().id(),
                                                tree.pattern().id(),
                                                tree.pattern().severity(),
                                                context.getStart().getLine(),
                                                context
                                                       .getStart()
                                                       .getCharPositionInLine(),
                                                context.getText()
                                        );
                                        result.compute(
                                                tree.rule().id(),
                                                (k, v) -> Optional
                                                        .ofNullable(v)
                                                        .map(i -> i + 1)
                                                        .orElse(1)
                                        );
                                    }
                            )
                    );
                    result.forEach((k, v) -> System.out.println(k + " :" + v));
                }
        )
                .print();
    }
}
