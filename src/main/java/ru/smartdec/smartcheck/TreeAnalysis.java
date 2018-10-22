package ru.smartdec.smartcheck;

import org.antlr.v4.runtime.ParserRuleContext;

import java.util.stream.Stream;

/**
 *
 */
public interface TreeAnalysis {

    /**
     * @return info
     * @throws Exception exception
     */
    Stream<TreeAnalysis.Info> stream() throws Exception;

    /**
     * @return info
     */
    default Stream<TreeAnalysis.Info> streamUnchecked() {
        try {
            return this.stream();
        } catch (Exception ex) {
            throw new RuntimeException(ex);
        }
    }

    /**
     *
     */
    interface Info {

        /**
         * @return rule
         */
        Rule rule();

        /**
         * @return pattern
         */
        Pattern pattern();

        /**
         * @return contexts
         */
        Stream<ParserRuleContext> contexts();
    }
}
