--- src/modules/avformat/filter_swscale.c.orig	2025-01-01 00:00:00 UTC
+++ src/modules/avformat/filter_swscale.c
@@ -170,8 +170,12 @@
         avinframe->height = iheight;
         avinframe->format = avformat;
         avinframe->sample_aspect_ratio = av_d2q(mlt_frame_get_aspect_ratio(frame), 1024);
-        avinframe->interlaced_frame = !mlt_properties_get_int(properties, "progressive");
-        avinframe->top_field_first = mlt_properties_get_int(properties, "top_field_first");
+        if (!mlt_properties_get_int(properties, "progressive"))
+            avinframe->flags |= AV_FRAME_FLAG_INTERLACED;
+        else
+            avinframe->flags &= ~AV_FRAME_FLAG_INTERLACED;
+        if (mlt_properties_get_int(properties, "top_field_first"))
+            avinframe->flags |= AV_FRAME_FLAG_TOP_FIELD_FIRST;
+        else
+            avinframe->flags &= ~AV_FRAME_FLAG_TOP_FIELD_FIRST;
         av_image_fill_arrays(avinframe->data,
                              avinframe->linesize,
                              *image,
