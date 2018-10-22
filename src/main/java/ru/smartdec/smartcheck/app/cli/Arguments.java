package ru.smartdec.smartcheck.app.cli;

import java.util.Arrays;
import java.util.Collection;
import java.util.Optional;

/**
 *
 */
public interface Arguments {

    /**
     * @param keys keys
     * @return optional
     */
    Optional<String> value(Collection<String> keys);

    /**
     * @param keys keys
     * @return optional
     */
    default Optional<String> value(final String... keys) {
        return this.value(Arrays.asList(keys));
    }
}
