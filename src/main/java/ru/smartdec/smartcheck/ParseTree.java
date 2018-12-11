package ru.smartdec.smartcheck;

import org.antlr.v4.runtime.tree.RuleNode;

/**
 *
 */
public interface ParseTree {

    /**
     * @return root
     * @throws Exception exception
     */
    RuleNode root() throws Exception;

    /**
     * @return root
     */
    default RuleNode rootUnchecked() {
        try {
            return this.root();
        } catch (Exception ex) {
            throw new RuntimeException(ex);
        }
    }
}
