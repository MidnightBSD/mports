--- crates/uv-torch/src/backend.rs.orig	2026-05-21 21:21:08 UTC
+++ crates/uv-torch/src/backend.rs
@@ -464,2 +464,3 @@
                     | Os::FreeBsd { .. }
+                | Os::MidnightBsd { .. }
                     | Os::NetBsd { .. }
@@ -496,2 +497,3 @@
                 | Os::FreeBsd { .. }
+                | Os::MidnightBsd { .. }
                 | Os::NetBsd { .. }
@@ -514,2 +516,3 @@
                 | Os::FreeBsd { .. }
+                | Os::MidnightBsd { .. }
                 | Os::NetBsd { .. }
