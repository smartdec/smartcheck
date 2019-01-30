package ru.smartdec.smartcheck.app.cli;

import com.google.devtools.common.options.Option;
import com.google.devtools.common.options.OptionsBase;

import java.util.List;

public class CliOptions extends OptionsBase {
    @Option(
            name = "help",
            abbrev = 'h',
            help = "Prints usage info.",
            defaultValue = "false"
    )
    public boolean help;

    @Option(
            name = "path",
            abbrev = 'p',
            help = "Path to directory or file",
            defaultValue = ".",
            category = "main"
    )
    public String path;

    @Option(
            name = "rules",
            abbrev = 'r',
            help = "(Optional) Path to .xml-file with rules",
            defaultValue = "",
            allowMultiple = true,
            category = "main"
    )
    public List<String> rules;

    @Option(
            name = "version",
            abbrev = 'v',
            help = "Print version",
            defaultValue = "false"
    )
    public boolean version;
}
