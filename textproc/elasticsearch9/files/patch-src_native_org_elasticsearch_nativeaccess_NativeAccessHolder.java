--- src/native/org/elasticsearch/nativeaccess/NativeAccessHolder.java.orig	2026-10-15 00:00:00 UTC
+++ src/native/org/elasticsearch/nativeaccess/NativeAccessHolder.java
@@ -31,6 +31,8 @@
                 inst = new MacNativeAccess(libProvider);
             } else if (os.startsWith("Windows")) {
                 inst = new WindowsNativeAccess(libProvider);
+            } else if (os.startsWith("MidnightBSD") || os.startsWith("FreeBSD")) {
+                inst = new BsdNativeAccess(libProvider);
             } else {
                 logger.warn("Unsupported OS [" + os + "]. Native methods will be disabled.");
             }
