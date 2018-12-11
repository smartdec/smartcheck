package ru.smartdec.smartcheck;

import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CharStreams;

import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.nio.file.Path;

/**
 *
 */
public final class SourceFile implements Source {

    /**
     *
     */
    private final Path path;
    /**
     *
     */
    private final Charset charset;

    /**
     * @param pt path
     * @param ch encoding
     */
    public SourceFile(final Path pt, final Charset ch) {
        this.path = pt;
        this.charset = ch;
    }

    /**
     * @param pt path
     */
    public SourceFile(final Path pt) {
        this(pt, StandardCharsets.UTF_8);
    }

    @Override
    public CharStream chars() throws Exception {
        return CharStreams.fromPath(this.path, this.charset);
    }
}
