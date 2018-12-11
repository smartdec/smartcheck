package ru.smartdec.smartcheck;

/**
 *
 */
public interface Pattern extends Query {

    /**
     * @return id
     */
    String id();

    /**
     * @return severity
     */
    int severity();
}
