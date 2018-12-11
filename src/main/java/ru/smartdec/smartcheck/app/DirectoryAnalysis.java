package ru.smartdec.smartcheck.app;

import ru.smartdec.smartcheck.TreeAnalysis;

import java.nio.file.Path;
import java.util.stream.Stream;

/**
 *
 */
public interface DirectoryAnalysis {

    /**
     * @return info
     * @throws Exception exception
     */
    Stream<DirectoryAnalysis.Info> stream() throws Exception;

    /**
     *
     */
    interface Info {

        /**
         * @return file
         */
        Path file();

        /**
         * @return tree report
         */
        TreeAnalysis treeReport();
    }
}
