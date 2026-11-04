--- bsd-src/jnr/posix/FreeBSDPOSIX.java.orig	2025-10-24 15:13:46 UTC
+++ bsd-src/jnr/posix/FreeBSDPOSIX.java
@@ -51,6 +51,12 @@
 
     FreeBSDPOSIX(LibCProvider libc, POSIXHandler handler) {
         super(libc, handler);
+
+        // MidnightBSD uses the post-FreeBSD 12 stat ABI.
+        if (System.getProperty("os.name").startsWith("MidnightBSD")) {
+            freebsdVersion = 12;
+            return;
+        }
 
         int parsed_version = 0;
 
