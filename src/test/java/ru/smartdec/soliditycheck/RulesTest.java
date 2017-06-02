package ru.smartdec.soliditycheck;

import lombok.EqualsAndHashCode;
import lombok.ToString;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.xpath.XPathFactory;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

public class RulesTest {

    private static final String EXTENSION = ".sol";

    private static String rule(final Path source) {
        final String name = source.getFileName().toString();
        return name.substring(0, name.length() - RulesTest.EXTENSION.length());
    }

    private DocumentBuilder builder;
    private Rules rules;
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
        this.sources = Files
                .walk(
                        Paths.get(
                                this.getClass().getResource("/rules").toURI()
                        ),
                        1
                )
                .filter(Files::isRegularFile)
                .filter(path -> path.toString().endsWith(RulesTest.EXTENSION))
                .collect(Collectors.toList());
    }

    @Test
    public void coverage() throws Exception {
        Assert.assertEquals(this.coverageExpected(), this.coverageActual());
    }

    @Test
    public void patterns() throws Exception {
        Assert.assertEquals(this.patternsExpected(), this.patternsActual());
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
                                        .collect(Collectors.toSet()),
                                (rule1, rule2) -> {
                                    throw new IllegalStateException();
                                },
                                LinkedHashMap::new
                        )
                );
    }

    private Map<String, Set<String>> coverageActual() throws Exception {
        final Map<String, Set<String>> result = new LinkedHashMap<>();
        for (final Path source : this.sources) {
            result.put(
                    RulesTest.rule(source),
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
        final Map<String, Set<LinePattern>> result = new LinkedHashMap<>();
        for (final Path source : this.sources) {
            result.put(
                    RulesTest.rule(source),
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
                .collect(Collectors.toCollection(LinkedHashSet::new));
    }

    private Map<String, Set<LinePattern>> patternsActual() throws Exception {
        final Map<String, Set<LinePattern>> result = new LinkedHashMap<>();
        for (final Path source : this.sources) {
            result.put(
                    RulesTest.rule(source),
                    this.patternsActual(
                            this.tree(source), RulesTest.rule(source)
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
                .collect(Collectors.toCollection(LinkedHashSet::new));
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
