package ru.smartdec.smartcheck.app;

/**
 *
 */
public final class ReportDefault implements Report {

    /**
     *
     */
    private final DirectoryAnalysis analysis;
    /**
     *
     */
    private final Media media;

    /**
     * @param da directory analysis
     * @param md media
     */
    public ReportDefault(final DirectoryAnalysis da, final Media md) {
        this.analysis = da;
        this.media = md;
    }

    @Override
    public void print() throws Exception {
        this.analysis.stream().forEach(this.media::accept);
    }
}
