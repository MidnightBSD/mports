--- libbeat/metric/system/process/process.go.orig	2020-05-09 12:55:45.581349000 -0400
+++ libbeat/metric/system/process/process.go	2020-05-09 12:56:32.496044000 -0400
@@ -162,7 +162,7 @@
 func getProcFDUsage(pid int) (*sigar.ProcFDUsage, error) {
 	// It's not possible to collect FD usage from other processes on FreeBSD
 	// due to linprocfs not exposing the information.
-	if runtime.GOOS == "freebsd" && pid != os.Getpid() {
+	if (runtime.GOOS == "freebsd" || runtime.GOOS == "midnightbsd") && pid != os.Getpid() {
 		return nil, nil
 	}
 
