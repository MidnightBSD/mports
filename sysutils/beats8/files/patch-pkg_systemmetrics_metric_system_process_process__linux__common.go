--- pkg/systemmetrics/metric/system/process/process_linux_common.go.orig	2026-10-24 06:18:20 UTC
+++ pkg/systemmetrics/metric/system/process/process_linux_common.go
@@ -26,6 +26,7 @@
 	"io"
 	"os"
 	"os/user"
+	"runtime"
 	"strconv"
 	"strings"
 	"syscall"
@@ -48,7 +49,8 @@
 // only be valid inside the container, and an attempt to fetch metrics from
 // `/hostfs/proc/` for that pid will fail. If we're using a hostfs, revert to _that_ for fetching the pid metrics.
 func GetSelfPid(hostfs resolve.Resolver) (int, error) {
-	if !hostfs.IsSet() {
+	// FreeBSD has no Linux PID namespace to translate through procfs.
+	if runtime.GOOS == "freebsd" || !hostfs.IsSet() {
 		return os.Getpid(), nil
 	}
 
