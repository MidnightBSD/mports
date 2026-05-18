--- src/modules/avformat/common.c.orig	2025-01-01 00:00:00 UTC
+++ src/modules/avformat/common.c
@@ -369,8 +369,12 @@
     avframe->format = mlt_to_av_image_format(image->format);
     avframe->sample_aspect_ratio = av_d2q(mlt_frame_get_aspect_ratio(mltframe), 1024);
     avframe->pts = mlt_frame_get_position(mltframe);
-    avframe->interlaced_frame = !mlt_properties_get_int(frame_properties, "progressive");
-    avframe->top_field_first = mlt_properties_get_int(frame_properties, "top_field_first");
+    if (!mlt_properties_get_int(frame_properties, "progressive"))
+        avframe->flags |= AV_FRAME_FLAG_INTERLACED;
+    else
+        avframe->flags &= ~AV_FRAME_FLAG_INTERLACED;
+    if (mlt_properties_get_int(frame_properties, "top_field_first"))
+        avframe->flags |= AV_FRAME_FLAG_TOP_FIELD_FIRST;
+    else
+        avframe->flags &= ~AV_FRAME_FLAG_TOP_FIELD_FIRST;
     avframe->color_primaries = mlt_properties_get_int(frame_properties, "color_primaries");
     avframe->color_trc = mlt_properties_get_int(frame_properties, "color_trc");
     avframe->color_range = mlt_properties_get_int(frame_properties, "full_range")
