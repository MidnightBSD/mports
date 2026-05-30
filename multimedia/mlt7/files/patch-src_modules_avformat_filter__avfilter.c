--- src/modules/avformat/filter_avfilter.c.orig	2025-01-01 00:00:00 UTC
+++ src/modules/avformat/filter_avfilter.c
@@ -802,10 +802,10 @@ static int filter_get_image(mlt_frame frame,
         pdata->avinframe->sample_aspect_ratio = (AVRational){profile->sample_aspect_num,
                                                              profile->sample_aspect_den};
         pdata->avinframe->pts = pos;
-        pdata->avinframe->interlaced_frame = !mlt_properties_get_int(frame_properties,
-                                                                     "progressive");
-        pdata->avinframe->top_field_first = mlt_properties_get_int(frame_properties,
-                                                                   "top_field_first");
+        mlt_avframe_set_interlaced(pdata->avinframe,
+                                   !mlt_properties_get_int(frame_properties, "progressive"));
+        mlt_avframe_set_top_field_first(pdata->avinframe,
+                                        mlt_properties_get_int(frame_properties, "top_field_first"));
         pdata->avinframe->color_primaries = mlt_properties_get_int(frame_properties,
                                                                    "color_primaries");
         pdata->avinframe->color_trc = mlt_properties_get_int(frame_properties, "color_trc");
