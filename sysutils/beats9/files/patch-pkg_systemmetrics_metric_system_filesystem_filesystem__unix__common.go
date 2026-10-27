--- pkg/systemmetrics/metric/system/filesystem/filesystem_unix_common.go.orig	2026-09-30 21:46:05 UTC
+++ pkg/systemmetrics/metric/system/filesystem/filesystem_unix_common.go
@@ -15,7 +15,7 @@
 // specific language governing permissions and limitations
 // under the License.
 
-//go:build freebsd || linux || aix || solaris
+//go:build linux || aix || solaris
 
 package filesystem
 
