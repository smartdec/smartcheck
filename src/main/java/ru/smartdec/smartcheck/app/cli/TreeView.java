package ru.smartdec.smartcheck.app.cli;

import org.antlr.v4.gui.TreeViewer;
import ru.smartdec.smartcheck.SourceFile;
import ru.smartdec.smartcheck.app.SourceLanguage;
import ru.smartdec.smartcheck.app.SourceLanguages;

import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Arrays;

/**
 *
 */
public final class TreeView {

    /**
     * @param args args
     * @throws Exception exception
     */
    public static void main(final String... args) throws Exception {
        ArgumentsDefault arguments = new ArgumentsDefault(args);

        Path src = arguments
                .value("-p", "--path")
                .map(Paths::get)
                .orElseThrow(IllegalArgumentException::new);

        new TreeView(src).run();
    }

    /**
     *
     */
    private final Path path;

    /**
     * @param src src
     */
    public TreeView(final Path src) {
        this.path = src;
    }

    /**
     * @throws Exception exception
     */
    public void run() throws Exception {
        final SourceLanguage sourceLanguage =
                SourceLanguages.fromFileName(this.path);
        if (sourceLanguage == null) {
            throw new IllegalArgumentException();
        }
        new TreeViewer(
                Arrays.asList(sourceLanguage.getRuleNames()),
                sourceLanguage.createParseTree(
                        new SourceFile(this.path)
                ).root()
        )
                .open()
                .get()
                .setVisible(true);
    }
}
