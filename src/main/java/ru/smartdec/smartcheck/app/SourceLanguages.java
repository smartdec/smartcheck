package ru.smartdec.smartcheck.app;

import lombok.EqualsAndHashCode;
import ru.smartdec.smartcheck.ParseTree;
import ru.smartdec.smartcheck.ParseTreeBasicSolidity;
import ru.smartdec.smartcheck.ParseTreeBasicVyper;
import ru.smartdec.smartcheck.SolidityParser;
import ru.smartdec.smartcheck.Source;
import ru.smartdec.smartcheck.VyperParser;

import java.nio.file.Path;

/**
 *
 */
public final class SourceLanguages {

    /**
     *
     */
    private SourceLanguages() { }

    /**
     *
     */
    @EqualsAndHashCode
    public static final class Solidity implements SourceLanguage {
        @Override
        public ParseTree createParseTree(final Source src) {
            return new ParseTreeBasicSolidity(src);
        }

        @Override
        public String[] getRuleNames() {
            return SolidityParser.ruleNames;
        }

        @Override
        public String fileExtension() {
            return ".sol";
        }

        @Override
        public String rulesFileName() {
            return "/solidity-rules.xml";
        }
    }

    /**
     *
     */
    @EqualsAndHashCode
    public static final class Vyper implements SourceLanguage {
        @Override
        public ParseTree createParseTree(final Source src) {
            return new ParseTreeBasicVyper(src);
        }

        @Override
        public String[] getRuleNames() {
            return VyperParser.ruleNames;
        }

        @Override
        public String fileExtension() {
            return ".vy";
        }

        @Override
        public String rulesFileName() {
            return "/vyper-rules.xml";
        }
    }

    /**
     *
     * @param file file
     * @return source language
     */
    public static SourceLanguage fromFileName(final Path file) {
        final SourceLanguage solidity = new Solidity();
        if (file.toString().endsWith(solidity.fileExtension())) {
            return solidity;
        }
        final SourceLanguage vyper = new Vyper();
        if (file.toString().endsWith(vyper.fileExtension())) {
            return vyper;
        }
        return null;
    }
}
