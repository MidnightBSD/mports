--- jack-dssi-host/jack-dssi-host.c.orig	2011-07-04 11:46:12 UTC
+++ jack-dssi-host/jack-dssi-host.c
@@ -121,2 +121,2 @@
 int osc_message_handler(const char *path, const char *types, lo_arg **argv, int
-		      argc, void *data, void *user_data) ;
+		      argc, lo_message data, void *user_data) ;
@@ -1921,2 +1921,2 @@
 int osc_message_handler(const char *path, const char *types, lo_arg **argv,
-                        int argc, void *data, void *user_data)
+                        int argc, lo_message data, void *user_data)
