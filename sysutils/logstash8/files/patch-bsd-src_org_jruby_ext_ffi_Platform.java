--- bsd-src/org/jruby/ext/ffi/Platform.java.orig	2026-06-08 16:33:04 UTC
+++ bsd-src/org/jruby/ext/ffi/Platform.java
@@ -108,6 +108,7 @@
         } else if (startsWithIgnoreCase(osName, "sunos") || startsWithIgnoreCase(osName, "solaris")) {
             return OS_TYPE.SOLARIS;
         }
+        if (startsWithIgnoreCase(osName, "midnightbsd")) return OS_TYPE.FREEBSD;
         for (OS_TYPE os : OS_TYPE.values()) {
             if (startsWithIgnoreCase(osName, os.toString())) {
                 return os;
