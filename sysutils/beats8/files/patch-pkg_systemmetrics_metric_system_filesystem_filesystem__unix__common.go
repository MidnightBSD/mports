--- pkg/systemmetrics/metric/system/filesystem/filesystem_unix_common.go.orig	2026-10-24 21:47:01 UTC
+++ pkg/systemmetrics/metric/system/filesystem/filesystem_unix_common.go
@@ -18 +18 @@
-//go:build freebsd || linux || aix || solaris
+//go:build linux || aix || solaris
