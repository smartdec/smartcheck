package ru.smartdec.smartcheck;

import java.util.stream.Stream;

/**
 *
 */
public interface Rules {

    /**
     * @return rules
     * @throws Exception exception
     */
    Stream<Rule> stream() throws Exception;

    /**
     * @return rules
     */
    default Stream<Rule> streamUnchecked() {
        try {
            return this.stream();
        } catch (Exception ex) {
            throw new RuntimeException(ex);
        }
    }
}
