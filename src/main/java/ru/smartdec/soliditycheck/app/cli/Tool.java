package ru.smartdec.soliditycheck.app.cli;

import ru.smartdec.soliditycheck.RulesXml;
import ru.smartdec.soliditycheck.app.DirectoryAnalysisDefault;
import ru.smartdec.soliditycheck.app.ReportDefault;
import ru.smartdec.soliditycheck.app.TreeFactoryDefault;

import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.xpath.XPathFactory;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

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
        new Tool(
                arguments
                        .value("-p", "-path")
                        .map(Paths::get)
                        .filter(Files::exists)
                        .orElseThrow(IllegalArgumentException::new),
                arguments
                        .value("-r", "-rules")
                        .map(Paths::get)
                        .filter(Files::isRegularFile)
                        .orElseThrow(IllegalArgumentException::new)
        )
                .run();
    }

    /**
     *
     */
    private final Path source;
    /**
     *
     */
    private final Path rules;

    /**
     * @param src source
     * @param rl  rules
     */
    public Tool(final Path src, final Path rl) {
        this.source = src;
        this.rules = rl;
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
                        new RulesXml(
                                this.rules,
                                XPathFactory.newInstance().newXPath(),
                                Throwable::printStackTrace
                        )
                ),
                info -> {
                    System.out.println(info.file());
                    info.treeReport().streamUnchecked().forEach(
                            tree -> tree.contexts().forEach(
                                    context -> System.out.printf(
                                            "ruleId: %s%npatternId: %s%n"
                                                    + "line: %d%ncolumn: %d%n"
                                                    + "content: %s%n%n",
                                            tree.rule().id(),
                                            tree.pattern().id(),
                                            context.getStart().getLine(),
                                            context
                                                    .getStart()
                                                    .getCharPositionInLine(),
                                            context.getText()
                                    )
                            )
                    );
                }
        )
                .print();
    }
}
