package ru.smartdec.soliditycheck.app;

import ru.smartdec.soliditycheck.DocumentTreeBasic;
import ru.smartdec.soliditycheck.DocumentTreeCached;
import ru.smartdec.soliditycheck.ParseTreeBasic;
import ru.smartdec.soliditycheck.ParseTreeCached;
import ru.smartdec.soliditycheck.SearchableTree;
import ru.smartdec.soliditycheck.SearchableTreeDefault;
import ru.smartdec.soliditycheck.SolidityParser;
import ru.smartdec.soliditycheck.SourceFile;

import javax.xml.parsers.DocumentBuilder;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.nio.file.Path;

/**
 *
 */
public final class TreeFactoryDefault implements TreeFactory {

    /**
     *
     */
    private final DocumentBuilder builder;
    /**
     *
     */
    private final Charset charset;

    /**
     * @param db builder
     * @param ch charset
     */
    public TreeFactoryDefault(final DocumentBuilder db, final Charset ch) {
        this.builder = db;
        this.charset = ch;
    }

    /**
     * @param db builder
     */
    public TreeFactoryDefault(final DocumentBuilder db) {
        this(db, StandardCharsets.UTF_8);
    }

    @Override
    public SearchableTree tree(final Path path) {
        return new SearchableTreeDefault(
                new DocumentTreeCached(
                        new DocumentTreeBasic(
                                new ParseTreeCached(
                                        new ParseTreeBasic(
                                                new SourceFile(
                                                        path,
                                                        this.charset
                                                )
                                        )
                                ),
                                this.builder,
                                SolidityParser.ruleNames
                        )
                )
        );
    }
}
