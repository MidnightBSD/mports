--- src/native/org/elasticsearch/nativeaccess/lib/LoaderHelper.java.orig	2026-10-15 00:00:00 UTC
+++ src/native/org/elasticsearch/nativeaccess/lib/LoaderHelper.java
@@ -46,6 +46,8 @@
             os = "linux";
         } else if (osname.startsWith("Mac OS")) {
             os = "darwin";
+        } else if (osname.startsWith("MidnightBSD") || osname.startsWith("FreeBSD")) {
+            os = "freebsd";
         } else {
             os = "unsupported_os[" + osname + "]";
         }
