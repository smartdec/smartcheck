package ru.smartdec.smartcheck.app;

import ru.smartdec.smartcheck.DocumentTreeBasic;
import ru.smartdec.smartcheck.DocumentTreeCached;
import ru.smartdec.smartcheck.ParseTreeBasic;
import ru.smartdec.smartcheck.ParseTreeCached;
import ru.smartdec.smartcheck.SearchableTree;
import ru.smartdec.smartcheck.SearchableTreeDefault;
import ru.smartdec.smartcheck.SolidityParser;
import ru.smartdec.smartcheck.SourceFile;

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
