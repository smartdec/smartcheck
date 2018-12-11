package ru.smartdec.smartcheck;

import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.RuleNode;

/**
 *
 */
public final class ParseTreeBasicSolidity implements ParseTree {

    /**
     *
     */
    private final Source source;

    /**
     * @param src source
     */
    public ParseTreeBasicSolidity(final Source src) {
        this.source = src;
    }

    @Override
    public RuleNode root() throws Exception {
        return new ru.smartdec.smartcheck.SolidityParser(
                new CommonTokenStream(
                        new ru.smartdec.smartcheck.SolidityLexer(
                                this.source.chars()
                        )
                )
        )
                .sourceUnit();
    }
}
