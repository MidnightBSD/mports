--- vendor/github.com/elastic/elastic-agent-system-metrics/metric/system/filesystem/filesystem_unix_common.go.orig	2026-10-24 21:30:10 UTC
+++ vendor/github.com/elastic/elastic-agent-system-metrics/metric/system/filesystem/filesystem_unix_common.go
@@ -18,2 +18,2 @@
-//go:build freebsd || linux
-// +build freebsd linux
+//go:build linux
+// +build linux
