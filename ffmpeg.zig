pub const c = @cImport({
    @cInclude("libavformat/avformat.h");
    @cInclude("libavcodec/avcodec.h");
    @cInclude("libavutil/avutil.h");
    @cInclude("libavutil/imgutils.h");
    @cInclude("libavutil/opt.h");
    @cInclude("libswscale/swscale.h");
    @cInclude("libswresample/swresample.h");
    @cInclude("libavutil/channel_layout.h");
    @cInclude("libavutil/samplefmt.h");
    // Filters for GIF palettegen/paletteuse pipeline
    @cInclude("libavfilter/avfilter.h");
    @cInclude("libavfilter/buffersrc.h");
    @cInclude("libavfilter/buffersink.h");
});
