--- lib/public_key/src/pubkey_os_cacerts.erl.orig	2026-10-20 00:00:00 UTC
+++ lib/public_key/src/pubkey_os_cacerts.erl
@@ -52,6 +52,8 @@
             load(bsd_paths(), undefined);
         {unix, freebsd} ->
             load(bsd_paths(), undefined);
+        {unix, midnightbsd} ->
+            load(bsd_paths(), undefined);
         {unix, netbsd} ->
             load(bsd_paths(), undefined);
         {unix, sunos} ->
