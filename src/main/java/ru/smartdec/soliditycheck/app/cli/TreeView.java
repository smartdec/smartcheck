package ru.smartdec.soliditycheck.app.cli;

import org.antlr.v4.gui.TreeViewer;
import ru.smartdec.soliditycheck.ParseTreeBasic;
import ru.smartdec.soliditycheck.SolidityParser;
import ru.smartdec.soliditycheck.SourceFile;

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
        new TreeView(
                new ArgumentsDefault(args)
                        .value("-p", "-path")
                        .map(Paths::get)
                        .orElseThrow(IllegalArgumentException::new)
        )
                .run();
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
        new TreeViewer(
                Arrays.asList(SolidityParser.ruleNames),
                new ParseTreeBasic(new SourceFile(this.path)).root()
        )
                .open()
                .get()
                .setVisible(true);
    }
}
