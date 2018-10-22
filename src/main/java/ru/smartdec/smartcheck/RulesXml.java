package ru.smartdec.smartcheck;

import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.Unmarshaller;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.adapters.XmlAdapter;
import javax.xml.bind.annotation.adapters.XmlJavaTypeAdapter;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpression;
import javax.xml.xpath.XPathExpressionException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Collection;
import java.util.function.Consumer;
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
        unmarshaller.setAdapter(new PatternAdapter(this.safeness));

        InputStream inputStream = Files.newInputStream(this.source.path());
        Object context = unmarshaller.unmarshal(inputStream);
        return ((RulesXml.RulesContext) context).rules.stream();
    }

    /**
     *
     */
    @XmlRootElement(name = "Rules")
    private static final class RulesContext {

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
        @XmlElement(name = "RuleId", required = true)
        private String id;
        /**
         *
         */
        @XmlElement(name = "Patterns")
        private PatternsContext patterns;
    }

    /**
     *
     */
    private static final class PatternsContext {

        /**
         *
         */
        @XmlElement(name = "Pattern")
        @XmlJavaTypeAdapter(RulesXml.PatternAdapter.class)
        private Collection<Pattern> patterns = new ArrayList<>();
    }

    /**
     *
     */
    private static final class PatternContext {

        /**
         *
         */
        @XmlAttribute(name = "patternId", required = true)
        private String id;
        /**
         *
         */
        @XmlElement(name = "Severity", required = true)
        private int severity;
        /**
         *
         */
        @SuppressWarnings("unused")
        @XmlElement(name = "Categories", required = true)
        private CategoriesContext categories;
        /**
         *
         */
        @SuppressWarnings("unused")
        @XmlElement(name = "TruePositiveRate", required = true)
        private int truePositiveRate;
        /**
         *
         */
        @XmlElement(name = "XPath", required = true)
        @XmlJavaTypeAdapter(RulesXml.XpathAdapter.class)
        private XPathExpression expression;
    }

    /**
     *
     */
    private static final class CategoriesContext {
        /**
         *
         */
        @SuppressWarnings("unused")
        @XmlElement(name = "Category")
        private Collection<String> categories = new ArrayList<>();
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
                    return value.patterns.patterns.stream();
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
                        final NodeList list = NodeList.class.cast(
                                value.expression.evaluate(
                                        node, XPathConstants.NODESET
                                )
                        );
                        result = IntStream
                                .range(0, list.getLength())
                                .mapToObj(list::item);
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
