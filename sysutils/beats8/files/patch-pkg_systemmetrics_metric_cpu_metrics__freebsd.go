--- pkg/systemmetrics/metric/cpu/metrics_freebsd.go.orig	2026-09-30 17:45:00 UTC
+++ pkg/systemmetrics/metric/cpu/metrics_freebsd.go
@@ -63,3 +63,7 @@ func parseCPULine(line string) (CPU, error) {
 
 	return cpuData, errors.Join(errs...)
 }
+
+func scanCPUInfoFile(scanner *bufio.Scanner) ([]CPUInfo, error) {
+	return cpuinfoScanner(scanner)
+}
