--- pkg/systemmetrics/metric/cpu/metrics_procfs_common.go.orig	2026-09-30 17:45:00 UTC
+++ pkg/systemmetrics/metric/cpu/metrics_procfs_common.go
@@ -36 +36 @@
-	path := procfs.ResolveHostFS("/proc/stat")
+	path := procfs.ResolveHostFS("/compat/linux/proc/stat")
@@ -52 +52 @@
-	cpuInfoPath := procfs.ResolveHostFS("/proc/cpuinfo")
+	cpuInfoPath := procfs.ResolveHostFS("/compat/linux/proc/cpuinfo")
