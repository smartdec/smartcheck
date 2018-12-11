package ru.smartdec.smartcheck.app.cli;

import ru.smartdec.smartcheck.RulesCached;
import ru.smartdec.smartcheck.RulesXml;
import ru.smartdec.smartcheck.app.DirectoryAnalysis;
import ru.smartdec.smartcheck.app.DirectoryAnalysisCombined;
import ru.smartdec.smartcheck.app.DirectoryAnalysisDefault;
import ru.smartdec.smartcheck.app.ReportDefault;
import ru.smartdec.smartcheck.app.SourceLanguage;
import ru.smartdec.smartcheck.app.SourceLanguages;
import ru.smartdec.smartcheck.app.TreeFactoryDefault;

import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.xpath.XPathFactory;
import java.net.URI;
import java.nio.file.FileSystemAlreadyExistsException;
import java.nio.file.FileSystems;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;
import java.util.function.Function;

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
                .value("-p", "--path")
                .map(Paths::get)
                .filter(Files::exists)
                .orElseThrow(IllegalArgumentException::new);

        Function<SourceLanguage, RulesXml.Source> defaultRules =
                sourceLanguage -> () -> {
            String rulesFileName = sourceLanguage.rulesFileName();
            URI uri = RulesXml
                    .class
                    .getResource(rulesFileName)
                    .toURI();
            System.out.print(uri);

            try {
                // initialize a new ZipFilesystem
                HashMap<String, String> env = new HashMap<>();
                env.put("create", "true");
                FileSystems.newFileSystem(uri, env);
            } catch (FileSystemAlreadyExistsException ex) {
                // great!
                // appease PMD
                int p = 0;
            }

            return Paths.get(uri);
        };

        Function<SourceLanguage, RulesXml.Source> rules = arguments
                .value("-r", "--rules")
                .map(Paths::get)
                .filter(Files::isRegularFile)
                .<Function<SourceLanguage, RulesXml.Source>>
                        map(path -> language -> () -> path)
                .orElse(defaultRules);

        new Tool(src, rules).run();
    }

    /**
     *
     */
    private final Path source;
    /**
     *
     */
    private final Function<
            ? super SourceLanguage,
            ? extends RulesXml.Source
    > rules;

    /**
     * @param src source
     * @param rs rules
     */
    public Tool(
            final Path src,
            final Function<
                    ? super SourceLanguage,
                    ? extends RulesXml.Source
            > rs
    ) {
        this.source = src;
        this.rules = rs;
    }

    /**
     *
     * @param sourceLanguage source language
     * @return directory analysis
     * @throws Exception exception
     */
    private DirectoryAnalysis makeDirectoryAnalysis(
            final SourceLanguage sourceLanguage
    ) throws Exception {
        return new DirectoryAnalysisDefault(
                this.source,
                p -> p.toString().endsWith(sourceLanguage.fileExtension()),
                new TreeFactoryDefault(
                        DocumentBuilderFactory
                                .newInstance()
                                .newDocumentBuilder(),
                        sourceLanguage
                ),
                new RulesCached(
                        new RulesXml(
                                this.rules.apply(sourceLanguage),
                                XPathFactory.newInstance().newXPath(),
                                Throwable::printStackTrace
                        )
                )
        );
    }

    /**
     * @throws Exception exception
     */
    public void run() throws Exception {
        new ReportDefault(
                new DirectoryAnalysisCombined(
                    makeDirectoryAnalysis(new SourceLanguages.Solidity()),
                    makeDirectoryAnalysis(new SourceLanguages.Vyper())
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
