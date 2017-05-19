package ru.smartdec.soliditycheck.app;

import ru.smartdec.soliditycheck.Rules;
import ru.smartdec.soliditycheck.TreeAnalysis;
import ru.smartdec.soliditycheck.TreeAnalysisDefault;

import java.nio.file.Files;
import java.nio.file.Path;
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
    private final TreeFactory trees;
    /**
     *
     */
    private final Rules rules;

    /**
     * @param src     path
     * @param factory tree factory
     * @param rl      rules
     */
    public DirectoryAnalysisDefault(
            final Path src, final TreeFactory factory, final Rules rl) {
        this.directory = src;
        this.trees = factory;
        this.rules = rl;
    }

    @Override
    public Stream<DirectoryAnalysis.Info> stream() throws Exception {
        return Files
                .walk(this.directory)
                .filter(Files::isRegularFile)
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
