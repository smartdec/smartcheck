package ru.smartdec.smartcheck.app;

import ru.smartdec.smartcheck.Rules;
import ru.smartdec.smartcheck.TreeAnalysis;
import ru.smartdec.smartcheck.TreeAnalysisDefault;

import java.nio.file.Files;
import java.nio.file.Path;
import java.util.function.Predicate;
import java.util.stream.Stream;

/**
 *
 */
public final class DirectoryAnalysisDefault implements DirectoryAnalysis {

    /**
     *
     */
    private final Path directory;
    /**
     *
     */
    private final Predicate<? super Path> fileFilter;
    /**
     *
     */
    private final TreeFactory trees;
    /**
     *
     */
    private final Rules rules;

    /**
     * @param src     path
     * @param filter filter
     * @param factory tree factory
     * @param rl      rules
     */
    public DirectoryAnalysisDefault(
            final Path src,
            final Predicate<? super Path> filter,
            final TreeFactory factory,
            final Rules rl
    ) {
        this.directory = src;
        this.fileFilter = filter;
        this.trees = factory;
        this.rules = rl;
    }

    @Override
    public Stream<DirectoryAnalysis.Info> stream() throws Exception {
        return Files
                .walk(this.directory)
                .filter(Files::isRegularFile)
                .filter(this.fileFilter)
                .map(
                        file -> new DirectoryAnalysis.Info() {
                            @Override
                            public Path file() {
                                return file;
                            }

                            @Override
                            public TreeAnalysis treeReport() {
                                return new TreeAnalysisDefault(
                                        DirectoryAnalysisDefault
                                                .this
                                                .trees
                                                .tree(file),
                                        DirectoryAnalysisDefault.this.rules
                                );
                            }
                        }
                );
    }
}
