--- vendor/cmake/src/lib.rs.orig	2020-08-27 22:17:51.274869000 -0400
+++ vendor/cmake/src/lib.rs	2020-08-27 22:18:18.813656000 -0400
@@ -656,6 +656,7 @@
                                 || cfg!(target_os = "openbsd")
                                 || cfg!(target_os = "netbsd")
                                 || cfg!(target_os = "freebsd")
+                                || cfg!(target_os = "midnihgtbsd")
                                 || cfg!(target_os = "bitrig")
                                 || cfg!(target_os = "dragonflybsd")) =>
                         {
