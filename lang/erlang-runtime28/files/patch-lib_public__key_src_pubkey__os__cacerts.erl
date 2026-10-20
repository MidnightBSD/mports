--- lib/public_key/src/pubkey_os_cacerts.erl.orig	2026-10-14 15:30:36 UTC
+++ lib/public_key/src/pubkey_os_cacerts.erl
@@ -72,6 +72,8 @@
         {unix, openbsd} ->
             load(bsd_paths(), DefError);
         {unix, freebsd} ->
+            load(bsd_paths(), DefError);
+        {unix, midnightbsd} ->
             load(bsd_paths(), DefError);
         {unix, dragonfly} ->
             load(bsd_paths(), DefError);
