--- vendor/github.com/elastic/elastic-agent-system-metrics/metric/system/process/process_linux_common.go.orig
+++ vendor/github.com/elastic/elastic-agent-system-metrics/metric/system/process/process_linux_common.go
@@ -26,6 +26,7 @@
 	"io"
 	"os"
 	"os/user"
+	"runtime"
 	"strconv"
 	"strings"
 	"syscall"
@@ -105,7 +106,7 @@
 
 	// FD metrics
 	state.FD, err = getFDStats(hostfs, pid)
-	if err != nil {
+	if err != nil && !(runtime.GOOS == "freebsd" && errors.Is(err, os.ErrNotExist)) {
 		return state, fmt.Errorf("error getting FD metrics for pid %d: %w", pid, err)
 	}
 
@@ -115,7 +116,7 @@
 	}
 
 	state.Exe, state.Cwd, err = getProcStringData(hostfs, pid)
-	if err != nil && !errors.Is(err, os.ErrPermission) { // ignore permission errors
+	if err != nil && !errors.Is(err, os.ErrPermission) && !(runtime.GOOS == "freebsd" && errors.Is(err, os.ErrNotExist)) {
 		return state, fmt.Errorf("error getting metadata for pid %d: %w", pid, err)
 	}
 
