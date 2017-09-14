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
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.equalTo;
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
        assertThat(
                "coverage",
                this.coverageActual(),
                equalTo(this.coverageExpected())
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
        return lines
                .stream()
                .map(
                        line -> Optional
                                .of(line.split("//"))
                                .filter(array -> array.length == 2)
                                .map(array -> array[1])
                )
                .filter(Optional::isPresent)
                .map(Optional::get)
                .collect(Collectors.toSet());
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
        return IntStream
                .range(0, lines.size())
                .mapToObj(
                        index -> Optional
                                .of(lines.get(index).split("//"))
                                .filter(array -> array.length == 2)
                                .map(array -> array[1])
                                .map(
                                        pattern -> new LinePattern(
                                                index + 1, pattern
                                        )
                                )
                )
                .filter(Optional::isPresent)
                .map(Optional::get)
                .collect(Collectors.toSet());
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
