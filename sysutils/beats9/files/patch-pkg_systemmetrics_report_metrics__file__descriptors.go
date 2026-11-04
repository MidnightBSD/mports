--- pkg/systemmetrics/report/metrics_file_descriptors.go.orig	2026-09-30 21:46:05 UTC
+++ pkg/systemmetrics/report/metrics_file_descriptors.go
@@ -15,7 +15,7 @@
 // specific language governing permissions and limitations
 // under the License.
 
-//go:build linux || (freebsd && cgo)
+//go:build linux
 
 package report
 
