--- src/ent/org/elasticsearch/entitlement/runtime/policy/Platform.java.orig	2026-10-15 00:00:00 UTC
+++ src/ent/org/elasticsearch/entitlement/runtime/policy/Platform.java
@@ -12,7 +12,8 @@
 public enum Platform {
     LINUX,
     MACOS,
-    WINDOWS;
+    WINDOWS,
+    BSD;
 
     private static final Platform current = findCurrent();
 
@@ -24,6 +25,8 @@
             return MACOS;
         } else if (os.startsWith("Windows")) {
             return WINDOWS;
+        } else if (os.startsWith("MidnightBSD") || os.startsWith("FreeBSD")) {
+            return BSD;
         } else {
             throw new AssertionError("Unsupported platform [" + os + "]");
         }
