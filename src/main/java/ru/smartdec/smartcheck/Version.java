package ru.smartdec.smartcheck;


import java.util.Collections;
import java.util.List;

/**
 *
 */
public final class Version implements Comparable<Version> {

    /**
     * @param list  list
     * @param index index
     * @param value default value
     * @param <T>   list element type
     * @return element at the specified position or default value
     */
    private static <T> T getOrDefault(
            final List<T> list, final int index, final T value) {
        T result = value;
        if (index < list.size()) {
            result = list.get(index);
        }
        return result;
    }

    /**
     *
     */
    private final List<Integer> value;

    /**
     * @param val value
     */
    public Version(final List<Integer> val) {
        this.value = val;
    }

    /**
     * @param val value
     */
    public Version(final Integer val) {
        this(Collections.singletonList(val));
    }

    @Override
    public int compareTo(final Version other) {
        int result = 0;
        final int size = Math.max(this.value.size(), other.value.size());
        for (int index = 0; index < size; index++) {
            final int first = getOrDefault(this.value, index, 0);
            final int second = getOrDefault(other.value, index, 0);
            if (first < second) {
                result = -1;
                break;
            } else if (first > second) {
                result = 1;
                break;
            }
        }
        return result;
    }
}
