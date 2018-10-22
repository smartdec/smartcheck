package ru.smartdec.smartcheck;

import org.antlr.v4.runtime.tree.TerminalNode;

import java.util.function.Function;
import java.util.stream.Stream;

/**
 *
 */
public class TerminalTransformer implements Function<TerminalNode, String> {
    /**
     *
     * @param terminalNode terminal node
     * @return stirng
     */
    @Override
    public final String apply(final TerminalNode terminalNode) {

        String text = terminalNode.getText();

        boolean trim = Stream.of("\"", "'")
                .anyMatch(c -> text.startsWith(c) && text.endsWith(c));
        if (trim) {
            return text.substring(1, text.length() - 1);
        }

        return text;
    }
}
