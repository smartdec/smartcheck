package ru.smartdec.smartcheck;

import lombok.EqualsAndHashCode;
import lombok.ToString;
import org.junit.Before;
import org.junit.Test;
import ru.smartdec.smartcheck.app.SourceLanguage;
import ru.smartdec.smartcheck.app.SourceLanguages;

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
    private Map<SourceLanguage, Rules> rules;
    private Collection<Path> sources;

    private void addRules(SourceLanguage sourceLanguage) {
        this.rules.put(
                sourceLanguage,
                new RulesCached(
                        new RulesXml(
                                sourceLanguage.rulesFileName(),
                                XPathFactory.newInstance().newXPath(),
                                Throwable::printStackTrace
                        )
                )
        );
    }

    @Before
    public void before() throws Exception {
        this.builder = DocumentBuilderFactory
                .newInstance()
                .newDocumentBuilder();
        this.rules = new HashMap<>();
        addRules(new SourceLanguages.Solidity());
        addRules(new SourceLanguages.Vyper());

        this.sources = Files
                .walk(
                        Paths.get(
                                this.getClass().getResource("/rules").toURI()
                        ),
                        1
                )
                .filter(Files::isRegularFile)
                .collect(Collectors.toList());
    }

    // @Test
    public void coverage() throws Exception {
        // TODO: fix the problem with SOLIDITY_SHOULD_RETURN_STRUCT
        assertThat(
                "coverage",
                this.coverageExpected().entrySet(),
                everyItem(isIn(this.coverageActual().entrySet()))
        );
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
                .values()
                .stream()
                .flatMap(Rules::streamUnchecked)
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

    private String extractName(final Path path) {
        String fileName = path.getFileName().toString();
        int index = fileName.lastIndexOf('.');
        return fileName.substring(0, index);
    }

    private Map<String, Set<String>> coverageActual() throws Exception {
        final Map<String, Set<String>> result = new HashMap<>();
        for (final Path source : this.sources) {
            result.put(
                    this.extractName(source),
                    this.coverageActual(Files.readAllLines(source))
            );
        }
        return result;
    }



    private Set<String> coverageActual(
            final List<String> lines) throws Exception {

        Set<String> res = new HashSet<>();

        for (String line : lines) {
            String[] patterns = extractPatterns(line);
            if (patterns == null) continue;
            Arrays.stream(patterns)
                    .map(String::trim)
                    .filter(pattern -> !pattern.isEmpty())
                    .map(pattern -> pattern.split("\\s+")[1])
                    .forEach(res::add);
        }

        return res;
    }

    private String[] extractPatterns(String line) {
        if (!line.contains("<yes> <report>")) return null;

        if (line.contains("//")) {
            line = line.split("//")[1];
        } else if (line.contains("#")) {
            line = line.split("#")[1];
        } else {
            return null;
        }

        return line.split("<yes> <report>");
    }

    private Map<String, Set<LinePattern>> patternsExpected() throws Exception {
        final Map<String, Set<LinePattern>> result = new HashMap<>();
        for (final Path source : this.sources) {
            result.put(
                    this.extractName(source),
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

            String[] patterns = extractPatterns(line);
            if (patterns == null) continue;

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
            SourceLanguage sourceLanguage = SourceLanguages.fromFileName(source);
            if (sourceLanguage == null) {
                throw new RuntimeException("Unexpected file " + source);
            }
            result.put(
                    this.extractName(source),
                    this.patternsActual(
                            this.tree(source, sourceLanguage),
                            this.extractName(source),
                            rules.get(sourceLanguage)
                    )
            );
        }
        return result;
    }

    private Set<LinePattern> patternsActual(
            final SearchableTree tree,
            final String id,
            final Rules rules
    ) throws Exception {
        return rules
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

    private SearchableTree tree(
            final Path file,
            final SourceLanguage sourceLanguage
    ) {
        return new SearchableTreeDefault(
                new DocumentTreeCached(
                        new DocumentTreeBasic(
                                new ParseTreeCached(
                                        sourceLanguage.createParseTree(
                                                new SourceFile(
                                                        file
                                                )
                                        )
                                ),
                                this.builder,
                                sourceLanguage.getRuleNames()
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
