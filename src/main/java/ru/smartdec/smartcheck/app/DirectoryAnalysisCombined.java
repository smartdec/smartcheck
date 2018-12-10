package ru.smartdec.smartcheck.app;

import java.util.Arrays;
import java.util.stream.Stream;

/**
 *
 */
public class DirectoryAnalysisCombined implements DirectoryAnalysis {

    /**
     *
     */
    private final DirectoryAnalysis[] elements;

    /**
     *
     * @param els elements
     */
    public DirectoryAnalysisCombined(final DirectoryAnalysis... els) {
        this.elements = els;
    }

    @Override
    public final Stream<Info> stream() throws Exception {
        return Arrays.stream(elements).flatMap(directoryAnalysis -> {
            try {
                return directoryAnalysis.stream();
            } catch (Exception ex) {
                throw new RuntimeException(ex);
            }
        });
    }
}
