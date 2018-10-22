package ru.smartdec.smartcheck;

import java.util.Optional;
import java.util.concurrent.atomic.AtomicReference;

/**
 *
 */
public final class DocumentTreeCached implements DocumentTree {

    /**
     *
     */
    private final DocumentTree origin;
    /**
     *
     */
    private final AtomicReference<DocumentTree.Info> cache;

    /**
     * @param tree      origin
     * @param reference cache
     */
    public DocumentTreeCached(
            final DocumentTree tree,
            final AtomicReference<DocumentTree.Info> reference) {
        this.origin = tree;
        this.cache = reference;
    }

    /**
     * @param tree origin
     */
    public DocumentTreeCached(final DocumentTree tree) {
        this(tree, new AtomicReference<>());
    }

    @Override
    public DocumentTree.Info info() {
        return this.cache.updateAndGet(
                info -> Optional
                        .ofNullable(info)
                        .orElseGet(this.origin::infoUnchecked)
        );
    }
}
