--- src/modules/avformat/producer_avformat.c.orig	2025-01-01 00:00:00 UTC
+++ src/modules/avformat/producer_avformat.c
@@ -340,10 +340,33 @@ static int first_video_index(producer_avformat self)

 #include <libavutil/spherical.h>

+static const uint8_t *mlt_av_stream_get_side_data(const AVStream *st,
+                                                  enum AVPacketSideDataType type,
+                                                  size_t *size)
+{
+#if LIBAVFORMAT_VERSION_MAJOR >= 62
+    const AVPacketSideData *sd = st && st->codecpar
+                                     ? av_packet_side_data_get(st->codecpar->coded_side_data,
+                                                               st->codecpar->nb_coded_side_data,
+                                                               type)
+                                     : NULL;
+    if (sd) {
+        if (size)
+            *size = sd->size;
+        return sd->data;
+    }
+    if (size)
+        *size = 0;
+    return NULL;
+#else
+    return av_stream_get_side_data(st, type, size);
+#endif
+}
+
 static const char *get_projection(AVStream *st)
 {
-    const AVSphericalMapping *spherical
-        = (const AVSphericalMapping *) av_stream_get_side_data(st, AV_PKT_DATA_SPHERICAL, NULL);
+    const uint8_t *spherical_data = mlt_av_stream_get_side_data(st, AV_PKT_DATA_SPHERICAL, NULL);
+    const AVSphericalMapping *spherical = (const AVSphericalMapping *) spherical_data;

     if (spherical)
         return av_spherical_projection_name(spherical->projection);
@@ -356,7 +379,7 @@ static double get_rotation(mlt_properties properties,
 {
     AVDictionaryEntry *rotate_tag = av_dict_get(st->metadata, "rotate", NULL, 0);
     int has_rotate_metadata = rotate_tag && *rotate_tag->value && strcmp(rotate_tag->value, "0");
-    uint8_t *displaymatrix = av_stream_get_side_data(st, AV_PKT_DATA_DISPLAYMATRIX, NULL);
+    const uint8_t *displaymatrix = mlt_av_stream_get_side_data(st, AV_PKT_DATA_DISPLAYMATRIX, NULL);
     double theta = mlt_properties_get_double(properties, "rotate");
     int has_mlt_rotate = !!mlt_properties_get(properties, "rotate");

@@ -429,8 +452,14 @@ static AVRational guess_frame_rate(producer_avformat s
     }
     if (isnan(fps) || isinf(fps) || fps < 1.0) {
         // Get the frame rate from the codec.
+#if LIBAVCODEC_VERSION_MAJOR >= 61
+        frame_rate = self->video_codec->framerate;
+        if (frame_rate.num == 0 || frame_rate.den == 0)
+            frame_rate = av_inv_q(self->video_codec->time_base);
+#else
         frame_rate.num = self->video_codec->time_base.den;
         frame_rate.den = self->video_codec->time_base.num * self->video_codec->ticks_per_frame;
+#endif
         fps = av_q2d(frame_rate);
     }
     if (isnan(fps) || isinf(fps) || fps < 1.0) {
@@ -1682,7 +1710,7 @@ static int sliced_h_pix_fmt_conv_proc(int id, int idx,
     struct SwsContext *sws;
     struct sliced_pix_fmt_conv_t *ctx = (struct sliced_pix_fmt_conv_t *) cookie;

-    interlaced = ctx->frame->interlaced_frame;
+    interlaced = mlt_avframe_get_interlaced(ctx->frame);
     field = (interlaced) ? (idx & 1) : 0;
     idx = (interlaced) ? (idx / 2) : idx;
     slices = (interlaced) ? (jobs / 2) : jobs;
@@ -1831,7 +1859,7 @@ static void convert_image(AVFrame *frame,
     uint8_t *out_data[4];
     int out_stride[4];

-    if (src_pix_fmt == AV_PIX_FMT_YUV420P && frame->interlaced_frame) {
+    if (src_pix_fmt == AV_PIX_FMT_YUV420P && mlt_avframe_get_interlaced(frame)) {
         // Perform field-aware conversion for 4:2:0
         int field_height = height / 2;
         const uint8_t *in_data[4];
@@ -2006,8 +2034,9 @@ static void convert_image(AVFrame *frame,

         int sliced = !getenv("MLT_AVFORMAT_SLICED_PIXFMT_DISABLE") && src_pix_fmt != ctx.dst_format;
         if (sliced) {
-            ctx.slice_w = (width < 1000) ? (256 >> frame->interlaced_frame)
-                                         : (512 >> frame->interlaced_frame);
+            int interlaced = mlt_avframe_get_interlaced(frame);
+            ctx.slice_w = (width < 1000) ? (256 >> interlaced)
+                                         : (512 >> interlaced);
         } else {
             ctx.slice_w = width;
         }
@@ -2018,10 +2047,11 @@ static void convert_image(AVFrame *frame,

         if (sliced && (last_slice_w % 8) == 0
             && !(ctx.src_format == AV_PIX_FMT_YUV422P && last_slice_w % 16)) {
-            c *= frame->interlaced_frame ? 2 : 1;
+            int interlaced = mlt_avframe_get_interlaced(frame);
+            c *= interlaced ? 2 : 1;
             mlt_slices_run_normal(c, sliced_h_pix_fmt_conv_proc, &ctx);
         } else {
-            c = frame->interlaced_frame ? 2 : 1;
+            c = mlt_avframe_get_interlaced(frame) ? 2 : 1;
             ctx.slice_w = width;
             for (i = 0; i < c; i++)
                 sliced_h_pix_fmt_conv_proc(i, i, c, &ctx);
@@ -2505,7 +2534,7 @@ static int producer_get_frame(mlt_producer producer, m
                         // there are I frames, and find_first_pts() fails as a result.
                         // Try to set first_pts here after getting pict_type.
                         if (self->first_pts == AV_NOPTS_VALUE
-                            && (self->video_frame->key_frame
+                            && (mlt_avframe_get_key_frame(self->video_frame)
                                 || self->video_frame->pict_type == AV_PICTURE_TYPE_I))
                             self->first_pts = pts;
                         if (self->first_pts != AV_NOPTS_VALUE)
@@ -2537,21 +2566,21 @@ static int producer_get_frame(mlt_producer producer, m
                     self->progressive = !!mlt_properties_get_int(properties, "force_progressive");
                 } else if (self->video_frame && codec_params) {
-                    self->progressive = !self->video_frame->interlaced_frame
+                    self->progressive = !mlt_avframe_get_interlaced(self->video_frame)
                                         && (codec_params->field_order == AV_FIELD_PROGRESSIVE
                                             || codec_params->field_order == AV_FIELD_UNKNOWN);
                 } else {
                     self->progressive = 0;
                 }
-                self->video_frame->interlaced_frame = !self->progressive;
+                mlt_avframe_set_interlaced(self->video_frame, !self->progressive);
                 // Detect and correct field order
                 if (mlt_properties_get(properties, "force_tff")) {
                     self->top_field_first = !!mlt_properties_get_int(properties, "force_tff");
                 } else {
-                    self->top_field_first = self->video_frame->top_field_first
+                    self->top_field_first = mlt_avframe_get_top_field_first(self->video_frame)
                                             || codec_params->field_order == AV_FIELD_TT
                                             || codec_params->field_order == AV_FIELD_TB;
                 }
-                self->video_frame->top_field_first = self->top_field_first;
+                mlt_avframe_set_top_field_first(self->video_frame, self->top_field_first);
 #ifdef AVFILTER
                 if ((self->autorotate || mlt_properties_get(properties, "filtergraph"))
                     && !setup_filters(self) && self->vfilter_graph) {
