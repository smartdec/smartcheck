package ru.smartdec.soliditycheck;

import java.nio.file.Path;
import java.util.function.Function;
import java.util.function.Predicate;

public final class FileExtension
        implements Function<Path, String>, Predicate<Path> {

    private final String extension;

    public FileExtension(final String ext) {
        this.extension = ext;
    }

    @Override
    public String apply(final Path path) {
        final String name = path.getFileName().toString();
        return name.substring(0, name.length() - this.extension.length());
    }

    @Override
    public boolean test(final Path path) {
        return path.toString().endsWith(this.extension);
    }
}
