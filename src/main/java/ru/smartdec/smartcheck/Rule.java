package ru.smartdec.smartcheck;

import java.util.stream.Stream;

/**
 *
 */
public interface Rule {

    /**
     * @return id
     */
    String id();

    /**
     * @return patterns
     */
    Stream<Pattern> patterns();
}
