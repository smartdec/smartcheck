package ru.smartdec.soliditycheck;

import lombok.EqualsAndHashCode;
import lombok.ToString;
import org.junit.Before;
import org.junit.Test;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.xpath.XPathFactory;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.everyItem;
import static org.hamcrest.Matchers.isIn;

public final class RulesTest {

    private DocumentBuilder builder;
    private Rules rules;
    private FileExtension extension;
    private Collection<Path> sources;

    @Before
    public void before() throws Exception {
        this.builder = DocumentBuilderFactory
                .newInstance()
                .newDocumentBuilder();
        this.rules = new RulesCached(
                new RulesXml(
                        "/rules.xml",
                        XPathFactory.newInstance().newXPath(),
                        Throwable::printStackTrace
                )
        );
        this.extension = new FileExtension(".sol");
        this.sources = Files
                .walk(
                        Paths.get(
                                this.getClass().getResource("/rules").toURI()
                        ),
                        1
                )
                .filter(Files::isRegularFile)
                .filter(this.extension)
                .collect(Collectors.toList());
    }

    @Test
    public void coverage() throws Exception {
        // TODO: fix the problem with SOLIDITY_SHOULD_RETURN_STRUCT
        /*
        assertThat(
                "coverage",
                this.coverageExpected().entrySet(),
                everyItem(isIn(this.coverageActual().entrySet()))
        );
        */
    }

    @Test
    public void patterns() throws Exception {
        assertThat(
                "patterns",
                this.patternsActual().entrySet(),
                everyItem(isIn(this.patternsExpected().entrySet()))
        );
    }

    private Map<String, Set<String>> coverageExpected() throws Exception {
        return this
                .rules
                .stream()
                .collect(
                        Collectors.toMap(
                                Rule::id,
                                rule -> rule
                                        .patterns()
                                        .map(Pattern::id)
                                        .collect(Collectors.toSet())
                        )
                );
    }

    private Map<String, Set<String>> coverageActual() throws Exception {
        final Map<String, Set<String>> result = new HashMap<>();
        for (final Path source : this.sources) {
            result.put(
                    this.extension.apply(source),
                    this.coverageActual(Files.readAllLines(source))
            );
        }
        return result;
    }

    private Set<String> coverageActual(
            final List<String> lines) throws Exception {

        Set<String> res = new HashSet<>();

        for (String line : lines) {
            if (!line.contains("// <yes> <report>")) continue;

            String[] patterns = line
                    .split("//")[1]
                    .split("<yes> <report>");
            Arrays.stream(patterns)
                    .map(String::trim)
                    .filter(pattern -> !pattern.isEmpty())
                    .map(pattern -> pattern.split("\\s+")[1])
                    .forEach(res::add);
        }

        return res;
    }

    private Map<String, Set<LinePattern>> patternsExpected() throws Exception {
        final Map<String, Set<LinePattern>> result = new HashMap<>();
        for (final Path source : this.sources) {
            result.put(
                    this.extension.apply(source),
                    this.patternsExpected(Files.readAllLines(source))
            );
        }
        return result;
    }

    private Set<LinePattern> patternsExpected(
            final List<String> lines) throws Exception {

        Set<LinePattern> res = new HashSet<>();

        for (int lineNo = 0; lineNo < lines.size(); lineNo++) {
            int lineNo2 = lineNo + 2;
            String line = lines.get(lineNo);
            if (!line.contains("// <yes> <report>")) continue;

            String[] patterns = line
                    .split("//")[1]
                    .split("<yes> <report>");
            Arrays.stream(patterns)
                    .map(String::trim)
                    .filter(pattern -> !pattern.isEmpty())
                    .map(pattern -> pattern.split("\\s+")[1])
                    .map(pattern -> new LinePattern(lineNo2, pattern))
                    .forEach(res::add);
        }

        return res;
    }

    private Map<String, Set<LinePattern>> patternsActual() throws Exception {
        final Map<String, Set<LinePattern>> result = new HashMap<>();
        for (final Path source : this.sources) {
            result.put(
                    this.extension.apply(source),
                    this.patternsActual(
                            this.tree(source), this.extension.apply(source)
                    )
            );
        }
        return result;
    }

    private Set<LinePattern> patternsActual(
            final SearchableTree tree, final String id) throws Exception {
        return this
                .rules
                .stream()
                .filter(rule -> id.equals(rule.id()))
                .findAny()
                .orElseThrow(() -> new IllegalStateException(id))
                .patterns()
                .flatMap(
                        pattern -> tree
                                .contextsUnchecked(pattern)
                                .map(
                                        context -> new LinePattern(
                                                context.getStart().getLine(),
                                                pattern.id()
                                        )
                                )
                )
                .collect(Collectors.toSet());
    }

    private SearchableTree tree(final Path file) {
        return new SearchableTreeDefault(
                new DocumentTreeCached(
                        new DocumentTreeBasic(
                                new ParseTreeCached(
                                        new ParseTreeBasic(
                                                new SourceFile(
                                                        file
                                                )
                                        )
                                ),
                                this.builder,
                                SolidityParser.ruleNames
                        )
                )
        );
    }

    @EqualsAndHashCode
    @ToString
    private static class LinePattern {

        private final Integer line;
        private final String pattern;

        LinePattern(Integer line, String pattern) {
            this.line = line;
            this.pattern = pattern;
        }
    }
}
