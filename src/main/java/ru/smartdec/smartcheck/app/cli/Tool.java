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
import java.io.*;
import java.net.URI;
import java.nio.file.FileSystemAlreadyExistsException;
import java.nio.file.FileSystems;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.*;
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
                    LinkedList<List<String>> report_fields = new LinkedList<>();
                    Map<String, Integer> result = new HashMap<>();
                    info.treeReport().streamUnchecked().forEach(
                            tree -> tree.contexts().forEach(
                                    context -> {
                                        LinkedList<String> fields = new LinkedList<>();
                                        String rule_name;
                                        try {
                                            List<String> content = Files.readAllLines(
                                                    Paths.get("rule_descriptions/"
                                                            .concat(tree.rule().id().concat("/name_en.txt"))));
                                            rule_name = content.get(0);
                                        } catch (IOException e) {
                                            rule_name = "";
                                        }
                                        fields.addLast("");
                                        fields.addLast(String.format("%d:%d", context.getStart().getLine(), context
                                                .getStart()
                                                .getCharPositionInLine()));
                                        fields.addLast(String.format("severity:%d", tree.pattern().severity()));
                                        fields.addLast(rule_name);
                                        fields.addLast(String.format("%s_%s", tree.rule().id(),
                                                tree.pattern().id()));
                                        result.compute(
                                                tree.rule().id(),
                                                (k, v) -> Optional
                                                        .ofNullable(v)
                                                        .map(i -> i + 1)
                                                        .orElse(1)
                                        );
                                        report_fields.addLast(fields);
                                    }
                            )
                    );
                    if (!report_fields.isEmpty()) {
                        System.out.println(info.file());
                        System.out.print(formatAsTable(report_fields));
                    }
                }
        )
                .print();
    }

    public static String formatAsTable(List<List<String>> rows)
    {
        if (rows.isEmpty()) return "";
        int[] maxLengths = new int[rows.get(0).size()];
        for (List<String> row : rows)
        {
            for (int i = 0; i < row.size(); i++)
            {
                maxLengths[i] = Math.max(maxLengths[i], row.get(i).length());
            }
        }

        StringBuilder formatBuilder = new StringBuilder();
        for (int maxLength : maxLengths)
        {
            formatBuilder.append("%-").append(maxLength + 3).append("s");
        }
        String format = formatBuilder.toString();

        StringBuilder result = new StringBuilder();
        for (List<String> row : rows)
        {
            result.append(String.format(format, row.toArray(new String[0]))).append("\n");
        }
        return result.toString();
    }
}
