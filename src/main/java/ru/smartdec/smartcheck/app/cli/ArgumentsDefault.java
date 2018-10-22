package ru.smartdec.smartcheck.app.cli;

import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import java.util.Optional;
import java.util.stream.IntStream;

/**
 *
 */
public final class ArgumentsDefault implements Arguments {

    /**
     *
     */
    private final List<String> arguments;

    /**
     * @param args arguments
     */
    public ArgumentsDefault(final List<String> args) {
        this.arguments = args;
    }

    /**
     * @param strings arguments
     */
    public ArgumentsDefault(final String... strings) {
        this(Arrays.asList(strings));
    }

    @Override
    public Optional<String> value(final Collection<String> keys) {
        return IntStream
                .range(0, this.arguments.size())
                .filter(index -> keys.contains(this.arguments.get(index)))
                .map(index -> index + 1)
                .filter(index -> index < this.arguments.size())
                .mapToObj(this.arguments::get)
                .findAny();
    }
}
