--- libbeat/autodiscover/providers/docker/docker.go.orig	2026-09-30 17:45:00 UTC
+++ libbeat/autodiscover/providers/docker/docker.go
@@ -15,7 +15,7 @@
 // specific language governing permissions and limitations
 // under the License.
 
-//go:build linux || darwin || windows
+//go:build linux || darwin || windows || freebsd
 
 package docker
