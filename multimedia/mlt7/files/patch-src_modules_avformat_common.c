--- src/modules/avformat/common.c.orig	2025-01-01 00:00:00 UTC
+++ src/modules/avformat/common.c
@@ -369,8 +369,8 @@ void mlt_image_to_avframe(mlt_image image, mlt_frame
     ;
     avframe->pts = mlt_frame_get_position(mltframe);
-    avframe->interlaced_frame = !mlt_properties_get_int(frame_properties, "progressive");
-    avframe->top_field_first = mlt_properties_get_int(frame_properties, "top_field_first");
+    mlt_avframe_set_interlaced(avframe, !mlt_properties_get_int(frame_properties, "progressive"));
+    mlt_avframe_set_top_field_first(avframe, mlt_properties_get_int(frame_properties, "top_field_first"));
     avframe->color_primaries = mlt_properties_get_int(frame_properties, "color_primaries");
     avframe->color_trc = mlt_properties_get_int(frame_properties, "color_trc");
     avframe->color_range = mlt_properties_get_int(frame_properties, "full_range")
