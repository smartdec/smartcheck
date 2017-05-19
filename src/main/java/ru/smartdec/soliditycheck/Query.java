package ru.smartdec.soliditycheck;

import org.w3c.dom.Node;

import java.util.stream.Stream;

/**
 *
 */
public interface Query {

    /**
     * @param node node
     * @return nodes
     */
    Stream<Node> nodes(Node node);
}
