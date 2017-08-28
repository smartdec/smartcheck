package ru.smartdec.soliditycheck;

import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.Unmarshaller;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlValue;
import javax.xml.bind.annotation.adapters.XmlAdapter;
import javax.xml.bind.annotation.adapters.XmlJavaTypeAdapter;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpression;
import javax.xml.xpath.XPathExpressionException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Optional;
import java.util.function.Consumer;
import java.util.stream.Collectors;
import java.util.stream.IntStream;
import java.util.stream.Stream;

/**
 *
 */
public final class RulesXml implements Rules {

    /**
     *
     */
    public interface Source {

        /**
         * @return path
         * @throws Exception exception
         */
        Path path() throws Exception;
    }

    /**
     *
     */
    private final RulesXml.Source source;
    /**
     *
     */
    private final XPath xpath;
    /**
     *
     */
    private final Consumer<Exception> safeness;


    /**
     * @param src      source to xml
     * @param xp       xpath
     * @param consumer safeness
     */
    public RulesXml(
            final RulesXml.Source src,
            final XPath xp,
            final Consumer<Exception> consumer) {
        this.source = src;
        this.xpath = xp;
        this.safeness = consumer;
    }

    /**
     * @param path     path to xml
     * @param xp       xpath
     * @param consumer safeness
     */
    public RulesXml(
            final Path path,
            final XPath xp,
            final Consumer<Exception> consumer) {
        this(() -> path, xp, consumer);
    }

    /**
     * @param resource resource path
     * @param xp       xpath
     * @param consumer safeness
     */
    public RulesXml(
            final String resource,
            final XPath xp,
            final Consumer<Exception> consumer) {
        this(
                () -> Paths.get(RulesXml.class.getResource(resource).toURI()),
                xp,
                consumer
        );
    }

    @Override
    public Stream<Rule> stream() throws Exception {
        final Unmarshaller unmarshaller = JAXBContext
                .newInstance(RulesXml.RulesContext.class)
                .createUnmarshaller();
        unmarshaller.setEventHandler(event -> false);
        unmarshaller.setAdapter(new RulesXml.XpathAdapter(this.xpath));
        final PatternAdapter common = new RulesXml.PatternAdapter(
                this.safeness
        );
        unmarshaller.setAdapter(common);
        final VersionPatternAdapter versioned = new VersionPatternAdapter(
                this.safeness
        );
        unmarshaller.setAdapter(versioned);
        unmarshaller.setListener(new Unmarshaller.Listener() {
            @Override
            public void afterUnmarshal(
                    final Object target, final Object parent) {
                if (target instanceof RulesContext) {
                    final XPathExpression version = RulesContext
                            .class
                            .cast(target)
                            .version;
                    common.version = version;
                    versioned.version = version;
                }
            }
        });
        return RulesXml
                .RulesContext
                .class
                .cast(unmarshaller.unmarshal(this.source.path().toFile()))
                .rules
                .stream();
    }

    /**
     *
     */
    @XmlRootElement(name = "Rules")
    private static final class RulesContext {

        /**
         *
         */
        @XmlElement(name = "VersionDefinition", required = true)
        @XmlJavaTypeAdapter(RulesXml.XpathAdapter.class)
        private XPathExpression version;
        /**
         *
         */
        @XmlElement(name = "Rule")
        @XmlJavaTypeAdapter(RulesXml.RuleAdapter.class)
        private Collection<Rule> rules = new ArrayList<>();
    }

    /**
     *
     */
    private static final class RuleContext {

        /**
         *
         */
        @XmlAttribute(required = true)
        private String id;
        /**
         *
         */
        @XmlElement(name = "Pattern")
        @XmlJavaTypeAdapter(RulesXml.PatternAdapter.class)
        private Collection<Pattern> common = new ArrayList<>();
        /**
         *
         */
        @XmlElement(name = "VersionPattern")
        @XmlJavaTypeAdapter(RulesXml.VersionPatternAdapter.class)
        private Collection<Pattern> versioned = new ArrayList<>();
    }

    /**
     *
     */
    private static final class VersionPatternContext {

        /**
         *
         */
        @XmlAttribute(required = true)
        private String id;
        /**
         *
         */
        @XmlAttribute(required = true)
        private int severity;
        /**
         *
         */
        @XmlAttribute
        @XmlJavaTypeAdapter(RulesXml.VersionAdapter.class)
        private Version min = new Version(0);
        /**
         *
         */
        @XmlAttribute
        @XmlJavaTypeAdapter(RulesXml.VersionAdapter.class)
        private Version max = new Version(Integer.MAX_VALUE);
    }

    /**
     *
     */
    private static final class PatternContext {

        /**
         *
         */
        @XmlAttribute(required = true)
        private String id;
        /**
         *
         */
        @XmlAttribute(required = true)
        private int severity;
        /**
         *
         */
        @XmlAttribute
        @XmlJavaTypeAdapter(RulesXml.VersionAdapter.class)
        private Version min = new Version(0);
        /**
         *
         */
        @XmlAttribute
        @XmlJavaTypeAdapter(RulesXml.VersionAdapter.class)
        private Version max = new Version(Integer.MAX_VALUE);
        /**
         *
         */
        @XmlValue
        @XmlJavaTypeAdapter(RulesXml.XpathAdapter.class)
        private XPathExpression expression;
    }

    /**
     *
     */
    private static final class VersionAdapter
            extends RulesXml.Parser<String, Version> {

        @Override
        public Version unmarshal(final String value) {
            return new Version(
                    Stream
                            .of(value.split("\\."))
                            .map(Integer::parseInt)
                            .collect(Collectors.toList())
            );
        }
    }

    /**
     *
     */
    private static final class RuleAdapter
            extends RulesXml.Parser<RuleContext, Rule> {

        @Override
        public Rule unmarshal(final RuleContext value)
                throws Exception {
            return new Rule() {

                @Override
                public String id() {
                    return value.id;
                }

                @Override
                public Stream<Pattern> patterns() {
                    return Stream.concat(
                            value.common.stream(), value.versioned.stream()
                    );
                }
            };
        }
    }

    /**
     *
     */
    private static final class PatternAdapter
            extends RulesXml.Parser<RulesXml.PatternContext, Pattern> {

        /**
         *
         */
        private XPathExpression version;
        /**
         *
         */
        private final Consumer<Exception> safeness;

        /**
         * @param consumer safeness
         */
        private PatternAdapter(final Consumer<Exception> consumer) {
            this.safeness = consumer;
        }

        @Override
        public Pattern unmarshal(final RulesXml.PatternContext value)
                throws Exception {
            return new Pattern() {

                @Override
                public Stream<Node> nodes(final Node node) {
                    Stream<Node> result = Stream.empty();
                    try {
                        final Optional<Version> pragma = Optional
                                .of(PatternAdapter.this.version.evaluate(node))
                                .filter(string -> !string.isEmpty())
                                .map(new VersionAdapter()::unmarshal);
                        final boolean matched = pragma
                                .filter(ver -> value.min.compareTo(ver) <= 0)
                                .filter(ver -> value.max.compareTo(ver) >= 0)
                                .isPresent();
                        if (!pragma.isPresent() || matched) {
                            final NodeList list = NodeList.class.cast(
                                    value.expression.evaluate(
                                            node, XPathConstants.NODESET
                                    )
                            );
                            result = IntStream
                                    .range(0, list.getLength())
                                    .mapToObj(list::item);
                        }
                    } catch (XPathExpressionException ex) {
                        PatternAdapter.this.safeness.accept(ex);
                    }
                    return result;
                }

                @Override
                public String id() {
                    return value.id;
                }

                @Override
                public int severity() {
                    return value.severity;
                }
            };
        }
    }

    /**
     *
     */
    private static final class VersionPatternAdapter
            extends RulesXml.Parser<RulesXml.VersionPatternContext, Pattern> {

        /**
         *
         */
        private XPathExpression version;
        /**
         *
         */
        private final Consumer<Exception> safeness;

        /**
         * @param consumer safeness
         */
        VersionPatternAdapter(final Consumer<Exception> consumer) {
            this.safeness = consumer;
        }

        @Override
        public Pattern unmarshal(final RulesXml.VersionPatternContext value)
                throws Exception {
            return new Pattern() {

                @Override
                public String id() {
                    return value.id;
                }

                @Override
                public int severity() {
                    return value.severity;
                }

                @Override
                public Stream<Node> nodes(final Node node) {
                    Stream<Node> result = Stream.empty();
                    try {
                        result = Optional
                                .of(
                                        VersionPatternAdapter
                                                .this
                                                .version
                                                .evaluate(node)
                                )
                                .filter(string -> !string.isEmpty())
                                .map(new VersionAdapter()::unmarshal)
                                .filter(ver -> value.min.compareTo(ver) <= 0)
                                .filter(ver -> value.max.compareTo(ver) >= 0)
                                .map(ver -> Stream.of(node))
                                .orElse(result);
                    } catch (XPathExpressionException ex) {
                        VersionPatternAdapter.this.safeness.accept(ex);
                    }
                    return result;
                }
            };
        }
    }

    /**
     *
     */
    private static final class XpathAdapter
            extends RulesXml.Parser<String, XPathExpression> {

        /**
         *
         */
        private final XPath xpath;

        /**
         * @param xp xpath
         */
        XpathAdapter(final XPath xp) {
            this.xpath = xp;
        }

        @Override
        public XPathExpression unmarshal(final String expression)
                throws Exception {
            return this.xpath.compile(expression);
        }
    }

    /**
     * @param <T> incoming type
     * @param <U> outgoing type
     */
    private abstract static class Parser<T, U> extends XmlAdapter<T, U> {

        @Override
        public final T marshal(final U value) throws Exception {
            throw new UnsupportedOperationException();
        }
    }
}
