package ru.smartdec.smartcheck;

import org.antlr.v4.runtime.ParserRuleContext;

import java.util.stream.Stream;

/**
 *
 */
public final class TreeAnalysisDefault implements TreeAnalysis {

    /**
     *
     */
    private final SearchableTree tree;
    /**
     *
     */
    private final Rules rules;

    /**
     * @param st tree
     * @param rl rules
     */
    public TreeAnalysisDefault(final SearchableTree st, final Rules rl) {
        this.tree = st;
        this.rules = rl;
    }

    @Override
    public Stream<TreeAnalysis.Info> stream() throws Exception {
        return this.rules.stream().flatMap(
                rule -> rule.patterns().map(
                        pattern -> new TreeAnalysis.Info() {
                            @Override
                            public Rule rule() {
                                return rule;
                            }

                            @Override
                            public Pattern pattern() {
                                return pattern;
                            }

                            @Override
                            public Stream<ParserRuleContext> contexts() {
                                return TreeAnalysisDefault
                                        .this
                                        .tree
                                        .contextsUnchecked(pattern);
                            }
                        }
                )
        );
    }
}
