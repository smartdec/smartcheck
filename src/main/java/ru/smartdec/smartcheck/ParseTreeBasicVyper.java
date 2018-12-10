package ru.smartdec.smartcheck;

import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.RuleNode;

/**
 *
 */
public final class ParseTreeBasicVyper implements ParseTree {

    /**
     *
     */
    private final Source source;

    /**
     * @param src source
     */
    public ParseTreeBasicVyper(final Source src) {
        this.source = src;
    }

    @Override
    public RuleNode root() throws Exception {
        return new ru.smartdec.smartcheck.VyperParser(
                new CommonTokenStream(
                        new ru.smartdec.smartcheck.VyperLexer(
                                this.source.chars()
                        )
                )
        )
                .file_input();
    }
}
