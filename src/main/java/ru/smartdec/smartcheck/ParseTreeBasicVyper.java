package ru.smartdec.smartcheck;

import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.ConsoleErrorListener;
import org.antlr.v4.runtime.Lexer;
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

    private Lexer lexerSetup(Lexer lexer) {
        lexer.removeErrorListener(ConsoleErrorListener.INSTANCE);
        return lexer;
    }

    private VyperParser parserSetup(VyperParser parser) {
        parser.removeErrorListener(ConsoleErrorListener.INSTANCE);
        return parser;
    }

    @Override
    public RuleNode root() throws Exception {
        return parserSetup(
                new ru.smartdec.smartcheck.VyperParser(
                        new CommonTokenStream(
                                lexerSetup(
                                        new ru.smartdec.smartcheck.VyperLexer(
                                                this.source.chars()
                                        )
                                )
                        )
                )
        )
                .file_input();
    }
}
