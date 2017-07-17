package ru.smartdec.soliditycheck;

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
