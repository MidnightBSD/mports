--- src/modules/avformat/consumer_avformat.c.orig	2025-01-01 00:00:00 UTC
+++ src/modules/avformat/consumer_avformat.c
@@ -2435,10 +2435,10 @@ static void *consumer_thread(void *arg)
                         avframe->pts = enc_ctx->frame_count;

                         // Set frame interlace hints
-                        avframe->interlaced_frame = !mlt_properties_get_int(frame_properties,
-                                                                            "progressive");
-                        avframe->top_field_first = mlt_properties_get_int(frame_properties,
-                                                                          "top_field_first");
+                        mlt_avframe_set_interlaced(avframe,
+                                                   !mlt_properties_get_int(frame_properties, "progressive"));
+                        mlt_avframe_set_top_field_first(avframe,
+                                                        mlt_properties_get_int(frame_properties, "top_field_first"));
                         if (mlt_properties_get_int(frame_properties, "progressive"))
                             c->field_order = AV_FIELD_PROGRESSIVE;
                         else if (c->codec_id == AV_CODEC_ID_MJPEG)
