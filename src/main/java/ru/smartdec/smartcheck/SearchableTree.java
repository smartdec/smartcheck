package ru.smartdec.smartcheck;

import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.tree.Tree;

import java.util.stream.Stream;

/**
 *
 */
public interface SearchableTree {

    /**
     * @param query query
     * @return nodes
     * @throws Exception exception
     */
    Stream<Tree> nodes(Query query) throws Exception;

    /**
     * @param query query
     * @return nodes
     */
    default Stream<ParserRuleContext> contextsUnchecked(final Query query) {
        try {
            return this
                    .nodes(query)
                    .filter(ParserRuleContext.class::isInstance)
                    .map(ParserRuleContext.class::cast);
        } catch (Exception ex) {
            throw new RuntimeException(ex);
        }
    }
}
