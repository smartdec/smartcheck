package ru.smartdec.smartcheck.app;

import ru.smartdec.smartcheck.SearchableTree;

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
