package ru.smartdec.smartcheck.app;

import ru.smartdec.smartcheck.ParseTree;
import ru.smartdec.smartcheck.Source;

/**
 *
 */
public interface SourceLanguage {
    /**
     *
     * @param src src
     * @return ParseTree
     */
    ParseTree createParseTree(Source src);

    /**
     *
     * @return rule names
     */
    String[] getRuleNames();

    /**
     *
     * @return file extension
     */
    String fileExtension();

    /**
     *
     * @return rules file name
     */
    String rulesFileName();
}
