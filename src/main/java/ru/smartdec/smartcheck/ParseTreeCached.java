package ru.smartdec.smartcheck;

import org.antlr.v4.runtime.tree.RuleNode;

import java.util.Optional;
import java.util.concurrent.atomic.AtomicReference;

/**
 *
 */
public final class ParseTreeCached implements ParseTree {

    /**
     *
     */
    private final ParseTree origin;
    /**
     *
     */
    private final AtomicReference<RuleNode> cache;

    /**
     * @param tree      parse tree to cache
     * @param reference cached tree
     */
    public ParseTreeCached(
            final ParseTree tree, final AtomicReference<RuleNode> reference) {
        this.origin = tree;
        this.cache = reference;
    }

    /**
     * @param tree parse tree to cache
     */
    public ParseTreeCached(final ParseTree tree) {
        this(tree, new AtomicReference<>());
    }

    @Override
    public RuleNode root() {
        return this.cache.updateAndGet(
                root -> Optional
                        .ofNullable(root)
                        .orElseGet(this.origin::rootUnchecked)
        );
    }
}
