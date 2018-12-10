package ru.smartdec.smartcheck;

import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.RuleContext;
import org.antlr.v4.runtime.tree.ErrorNode;
import org.antlr.v4.runtime.tree.ParseTreeListener;
import org.antlr.v4.runtime.tree.ParseTreeWalker;
import org.antlr.v4.runtime.tree.RuleNode;
import org.antlr.v4.runtime.tree.TerminalNode;
import org.antlr.v4.runtime.tree.Tree;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.Text;

import javax.xml.parsers.DocumentBuilder;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.function.Function;
import java.util.function.Supplier;

/**
 *
 */
public final class DocumentTreeBasic implements DocumentTree {

    /**
     *
     */
    private final ParseTree tree;
    /**
     *
     */
    private final Supplier<Document> documents;
    /**
     *
     */
    private final Function<RuleContext, String> rules;
    /**
     *
     */
    private final Function<TerminalNode, String> terminals;

    /**
     * @param pt       tree
     * @param supplier document factory
     * @param frs      rule nodes naming
     * @param fts      terminals naming
     */
    public DocumentTreeBasic(
            final ParseTree pt,
            final Supplier<Document> supplier,
            final Function<RuleContext, String> frs,
            final Function<TerminalNode, String> fts
    ) {
        this.tree = pt;
        this.documents = supplier;
        this.rules = frs;
        this.terminals = fts;
    }

    /**
     * @param pt      tree
     * @param builder document factory
     * @param names   rule names
     */
    public DocumentTreeBasic(
            final ParseTree pt,
            final DocumentBuilder builder,
            final List<String> names
    ) {
        this(
                pt,
                builder::newDocument,
                node -> names.get(node.getRuleIndex()),
                new TerminalTransformer()
        );
    }

    /**
     * @param pt      tree
     * @param builder document factory
     * @param names   rule names
     */
    public DocumentTreeBasic(
            final ParseTree pt,
            final DocumentBuilder builder,
            final String[] names
    ) {
        this(pt, builder, Arrays.asList(names));
    }


    @Override
    public Info info() throws Exception {
        final Map<Tree, Node> nodes = new HashMap<>();
        final RuleNode root = this.tree.root();
        ParseTreeWalker.DEFAULT.walk(
                new ParseTreeListener() {

                    private final Document document = DocumentTreeBasic
                            .this
                            .documents
                            .get();

                    @Override
                    public void visitTerminal(final TerminalNode node) {
                        final Text text = this.document.createTextNode(
                                DocumentTreeBasic.this.terminals.apply(node)
                        );
                        nodes.put(node, text);
                        nodes.get(node.getParent()).appendChild(text);
                    }

                    @Override
                    public void visitErrorNode(final ErrorNode node) {
                    }

                    @Override
                    public void enterEveryRule(final ParserRuleContext ctx) {
                        final Node element = this.document.createElement(
                                DocumentTreeBasic.this.rules.apply(ctx)
                        );
                        nodes.put(ctx, element);
                        Optional
                                .ofNullable(ctx.getParent())
                                .map(nodes::get)
                                .orElse(this.document)
                                .appendChild(element);
                    }

                    @Override
                    public void exitEveryRule(final ParserRuleContext ctx) {
                    }
                },
                root
        );
        return new DocumentTree.Info() {
            @Override
            public RuleNode ruleNode() {
                return root;
            }

            @Override
            public Map<Tree, Node> elements() {
                return nodes;
            }
        };
    }
}
