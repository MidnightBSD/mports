--- scripts/wsrep_sst_common.sh.orig	2026-10-03 00:00:00 UTC
+++ scripts/wsrep_sst_common.sh
@@ -28 +28 @@
-if [ "$OS" != 'Darwin' ]; then
+if [ "$OS" != 'Darwin' ] && [ "$OS" != 'FreeBSD' ] && [ "$OS" != 'MidnightBSD' ]; then
