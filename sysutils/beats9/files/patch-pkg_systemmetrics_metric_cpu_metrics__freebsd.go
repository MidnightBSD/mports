--- pkg/systemmetrics/metric/cpu/metrics_freebsd.go.orig	2026-09-30 21:46:05 UTC
+++ pkg/systemmetrics/metric/cpu/metrics_freebsd.go
@@ -56,3 +56,7 @@
 
 	return cpuData, errors.Join(errs...)
 }
+
+func scanCPUInfoFile(scanner *bufio.Scanner) ([]CPUInfo, error) {
+	return cpuinfoScanner(scanner)
+}
