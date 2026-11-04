--- src/modules/avformat/link_avfilter.c.orig	2025-01-01 00:00:00 UTC
+++ src/modules/avformat/link_avfilter.c
@@ -917,10 +917,10 @@ static int link_filter_get_image(mlt_frame frame,
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
