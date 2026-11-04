--- bsd-src/org/jruby/platform/Platform.java.orig	2026-06-08 16:33:04 UTC
+++ bsd-src/org/jruby/platform/Platform.java
@@ -74,6 +74,7 @@
         if (osname.startsWith("sunos")) {
             return SOLARIS;
         }
+        if (osname.startsWith("midnightbsd")) return FREEBSD;
         return osname;
     }
 
