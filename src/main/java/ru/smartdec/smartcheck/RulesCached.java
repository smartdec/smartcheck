package ru.smartdec.smartcheck;

import java.util.Collection;
import java.util.Optional;
import java.util.concurrent.atomic.AtomicReference;
import java.util.stream.Collectors;
import java.util.stream.Stream;

/**
 *
 */
public final class RulesCached implements Rules {

    /**
     *
     */
    private final Rules origin;
    /**
     *
     */
    private final AtomicReference<Collection<Rule>> cache;

    /**
     * @param rules     rules
     * @param reference cache
     */
    public RulesCached(
            final Rules rules,
            final AtomicReference<Collection<Rule>> reference) {
        this.origin = rules;
        this.cache = reference;
    }

    /**
     * @param rules rules
     */
    public RulesCached(final Rules rules) {
        this(rules, new AtomicReference<>());
    }

    @Override
    public Stream<Rule> stream() throws Exception {
        return this.cache.updateAndGet(
                rules -> Optional
                        .ofNullable(rules)
                        .orElseGet(
                                () -> this.origin.streamUnchecked().collect(
                                        Collectors.toList()
                                )
                        )
        )
                .stream();
    }
}
