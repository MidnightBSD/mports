--- src/lazr/restfulclient/authorize/oauth.py.orig	2021-11-17 10:38:41 UTC
+++ src/lazr/restfulclient/authorize/oauth.py
@@ -191,7 +191,7 @@
         """
         # Attempt to load the access token from the file.
         parser = SafeConfigParser()
-        reader = getattr(parser, "read_file", parser.readfp)
+        reader = getattr(parser, "read_file", None) or parser.readfp
         reader(readable_file)
         # Check the version number and extract the access token and
         # secret.  Then convert these to the appropriate instances.
