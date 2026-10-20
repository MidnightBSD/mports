--- lib/public_key/src/pubkey_os_cacerts.erl.orig	2026-10-20 00:00:00 UTC
+++ lib/public_key/src/pubkey_os_cacerts.erl
@@ -51,6 +51,8 @@
             load_from_file(bsd_paths());
         {unix, freebsd} ->
             load_from_file(bsd_paths());
+        {unix, midnightbsd} ->
+            load_from_file(bsd_paths());
         {unix, netbsd} ->
             load_from_file(bsd_paths());
         {unix, sunos} ->
