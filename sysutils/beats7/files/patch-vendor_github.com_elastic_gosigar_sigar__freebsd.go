--- vendor/github.com/elastic/gosigar/sigar_freebsd.go.orig	2026-10-24 06:06:52 UTC
+++ vendor/github.com/elastic/gosigar/sigar_freebsd.go
@@ -4,9 +4,11 @@
 
 import (
 	"io/ioutil"
+	"os"
 	"runtime"
 	"strconv"
 	"strings"
+	"syscall"
 	"unsafe"
 )
 
@@ -73,17 +75,26 @@
 }
 
 func (self *ProcFDUsage) Get(pid int) error {
-	err := readFile("/proc/"+strconv.Itoa(pid)+"/rlimit", func(line string) bool {
-		if strings.HasPrefix(line, "nofile") {
-			fields := strings.Fields(line)
-			if len(fields) == 3 {
-				self.SoftLimit, _ = strconv.ParseUint(fields[1], 10, 64)
-				self.HardLimit, _ = strconv.ParseUint(fields[2], 10, 64)
+	var err error
+	if pid == os.Getpid() {
+		// The caller's limits are available without mounting native procfs.
+		var limits syscall.Rlimit
+		err = syscall.Getrlimit(syscall.RLIMIT_NOFILE, &limits)
+		self.SoftLimit = uint64(limits.Cur)
+		self.HardLimit = uint64(limits.Max)
+	} else {
+		err = readFile("/proc/"+strconv.Itoa(pid)+"/rlimit", func(line string) bool {
+			if strings.HasPrefix(line, "nofile") {
+				fields := strings.Fields(line)
+				if len(fields) == 3 {
+					self.SoftLimit, _ = strconv.ParseUint(fields[1], 10, 64)
+					self.HardLimit, _ = strconv.ParseUint(fields[2], 10, 64)
+				}
+				return false
 			}
-			return false
-		}
-		return true
-	})
+			return true
+		})
+	}
 	if err != nil {
 		return err
 	}
