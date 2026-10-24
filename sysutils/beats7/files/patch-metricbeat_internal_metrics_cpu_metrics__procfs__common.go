--- metricbeat/internal/metrics/cpu/metrics_procfs_common.go.orig	2025-06-18 16:13:39 UTC
+++ metricbeat/internal/metrics/cpu/metrics_procfs_common.go
@@ -24,6 +24,7 @@
 	"bufio"
 	"os"
 	"path/filepath"
+	"runtime"
 	"strconv"
 
 	"github.com/pkg/errors"
@@ -31,11 +32,18 @@
 
 // Get returns a metrics object for CPU data
 func Get(procfs string) (CPUMetrics, error) {
+	// FreeBSD and MidnightBSD mount linprocfs below /compat/linux.
+	// Keep an explicitly configured host filesystem root unchanged.
+	if runtime.GOOS == "freebsd" && (procfs == "" || procfs == "/") {
+		procfs = "/compat/linux"
+	}
 	path := filepath.Join(procfs, "/proc/stat")
 	fd, err := os.Open(path)
 	if err != nil {
 		return CPUMetrics{}, errors.Wrapf(err, "error opening file %s", path)
 	}
+
+	defer fd.Close()
 
 	return scanStatFile(bufio.NewScanner(fd))
 
