package ru.smartdec.soliditycheck.app;

import ru.smartdec.soliditycheck.SearchableTree;

import java.nio.file.Path;

/**
 *
 */
public interface TreeFactory {

    /**
     * @param path source
     * @return tree
     */
    SearchableTree tree(Path path);
}
