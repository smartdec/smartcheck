package ru.smartdec.smartcheck.app.cli;

import ru.smartdec.smartcheck.DocumentTreeBasic;
import ru.smartdec.smartcheck.SourceFile;
import ru.smartdec.smartcheck.app.SourceLanguage;
import ru.smartdec.smartcheck.app.SourceLanguages;

import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import java.nio.file.Path;
import java.nio.file.Paths;

/**
 *
 */
public final class XmlView {

    /**
     * @param args args
     * @throws Exception Exception
     */
    public static void main(final String... args) throws Exception {
        XmlView.main(new ArgumentsDefault(args));
    }

    /**
     * @param arguments args
     * @throws Exception exception
     */
    public static void main(final Arguments arguments) throws Exception {
        Path src = arguments
                .value("-s", "--source")
                .map(Paths::get)
                .orElseThrow(IllegalArgumentException::new);
        Path target = arguments
                .value("-t", "--target")
                .map(Paths::get)
                .orElseThrow(IllegalArgumentException::new);

        new XmlView(src, target).run();
    }

    /**
     *
     */
    private final Path source;
    /**
     *
     */
    private final Path target;

    /**
     * @param src source
     * @param tr  target
     */
    public XmlView(final Path src, final Path tr) {
        this.source = src;
        this.target = tr;
    }

    /**
     * @throws Exception exception
     */
    public void run() throws Exception {
        final SourceLanguage sourceLanguage =
                SourceLanguages.fromFileName(this.source);
        if (sourceLanguage == null) {
            throw new IllegalArgumentException();
        }
        final Transformer transformer = TransformerFactory
                .newInstance()
                .newTransformer();
        transformer.setOutputProperty(OutputKeys.INDENT, "yes");
        transformer.transform(
                new DOMSource(
                        new DocumentTreeBasic(
                                sourceLanguage.createParseTree(
                                        new SourceFile(this.source)
                                ),
                                DocumentBuilderFactory
                                        .newInstance()
                                        .newDocumentBuilder(),
                                sourceLanguage.getRuleNames()
                        )
                                .info()
                                .node()
                ),
                new StreamResult(this.target.toFile())
        );
    }
}
