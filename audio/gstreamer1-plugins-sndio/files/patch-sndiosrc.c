--- sndiosrc.c.orig	2026-07-01 02:16:00 UTC
+++ sndiosrc.c
@@ -46,6 +46,6 @@ static gboolean gst_sndiosrc_prepare (GstAudioSrc * as
 static gboolean gst_sndiosrc_unprepare (GstAudioSrc * asrc);
 static guint gst_sndiosrc_read (GstAudioSrc * asrc, gpointer data,
-    guint length);
+    guint length, GstClockTime * timestamp);
 static guint gst_sndiosrc_delay (GstAudioSrc * asrc);
 static void gst_sndiosrc_reset (GstAudioSrc * asrc);
 static void gst_sndiosrc_set_property (GObject * object, guint prop_id,
@@ -116,5 +116,9 @@ gst_sndiosrc_unprepare (GstAudioSrc * asrc)
 static guint
-gst_sndiosrc_read (GstAudioSrc * asrc, gpointer data, guint length)
+gst_sndiosrc_read (GstAudioSrc * asrc, gpointer data, guint length,
+    GstClockTime * timestamp)
 {
   GstSndioSrc *src = GST_SNDIOSRC (asrc);
   guint done;
+
+  if (timestamp != NULL)
+    *timestamp = GST_CLOCK_TIME_NONE;
