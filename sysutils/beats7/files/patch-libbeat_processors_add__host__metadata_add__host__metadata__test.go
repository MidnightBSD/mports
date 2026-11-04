--- libbeat/processors/add_host_metadata/add_host_metadata_test.go.orig	2025-06-18 16:13:39 UTC
+++ libbeat/processors/add_host_metadata/add_host_metadata_test.go
@@ -49 +49 @@
-	case "windows", "darwin", "linux":
+	case "windows", "darwin", "linux", "freebsd":
@@ -96 +96 @@
-	case "windows", "darwin", "linux":
+	case "windows", "darwin", "linux", "freebsd":
@@ -222 +222 @@
-	case "windows", "darwin", "linux":
+	case "windows", "darwin", "linux", "freebsd":
@@ -302 +302 @@
-	case "windows", "darwin", "linux":
+	case "windows", "darwin", "linux", "freebsd":
