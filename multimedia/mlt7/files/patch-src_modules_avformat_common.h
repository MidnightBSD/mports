--- src/modules/avformat/common.h.orig	2025-01-01 00:00:00 UTC
+++ src/modules/avformat/common.h
@@ -20,10 +20,63 @@
 #include <framework/mlt.h>
 #include <libavutil/frame.h>
 #include <libswscale/swscale.h>
+#include <libavutil/version.h>

 #define MLT_AVFILTER_SWS_FLAGS "bicubic+accurate_rnd+full_chroma_int+full_chroma_inp"
 #define HAVE_FFMPEG_CH_LAYOUT (LIBAVUTIL_VERSION_MAJOR >= 59)
+#define HAVE_FFMPEG_FRAME_FLAGS (LIBAVUTIL_VERSION_MAJOR >= 59)

+static inline int mlt_avframe_get_interlaced(const AVFrame *frame)
+{
+#if HAVE_FFMPEG_FRAME_FLAGS
+    return !!(frame->flags & AV_FRAME_FLAG_INTERLACED);
+#else
+    return frame->interlaced_frame;
+#endif
+}
+
+static inline int mlt_avframe_get_top_field_first(const AVFrame *frame)
+{
+#if HAVE_FFMPEG_FRAME_FLAGS
+    return !!(frame->flags & AV_FRAME_FLAG_TOP_FIELD_FIRST);
+#else
+    return frame->top_field_first;
+#endif
+}
+
+static inline int mlt_avframe_get_key_frame(const AVFrame *frame)
+{
+#if HAVE_FFMPEG_FRAME_FLAGS
+    return !!(frame->flags & AV_FRAME_FLAG_KEY);
+#else
+    return frame->key_frame;
+#endif
+}
+
+static inline void mlt_avframe_set_interlaced(AVFrame *frame, int interlaced)
+{
+#if HAVE_FFMPEG_FRAME_FLAGS
+    if (interlaced)
+        frame->flags |= AV_FRAME_FLAG_INTERLACED;
+    else
+        frame->flags &= ~AV_FRAME_FLAG_INTERLACED;
+#else
+    frame->interlaced_frame = interlaced;
+#endif
+}
+
+static inline void mlt_avframe_set_top_field_first(AVFrame *frame, int top_field_first)
+{
+#if HAVE_FFMPEG_FRAME_FLAGS
+    if (top_field_first)
+        frame->flags |= AV_FRAME_FLAG_TOP_FIELD_FIRST;
+    else
+        frame->flags &= ~AV_FRAME_FLAG_TOP_FIELD_FIRST;
+#else
+    frame->top_field_first = top_field_first;
+#endif
+}
+
 int mlt_to_av_sample_format(mlt_audio_format format);
 int64_t mlt_to_av_channel_layout(mlt_channel_layout layout);
 #if HAVE_FFMPEG_CH_LAYOUT
