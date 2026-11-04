--- bsd-src/com/kenai/jffi/Platform.java.orig	2026-03-31 17:27:58 UTC
+++ bsd-src/com/kenai/jffi/Platform.java
@@ -161,7 +161,7 @@
         } else if (startsWithIgnoreCase(osName, "openbsd")) {
             return OS.OPENBSD;
         
-        } else if (startsWithIgnoreCase(osName, "freebsd")) {
+        } else if (startsWithIgnoreCase(osName, "freebsd") || startsWithIgnoreCase(osName, "midnightbsd")) {
             return OS.FREEBSD;
 
         } else if (startsWithIgnoreCase(osName, "dragonfly")) {
@@ -379,7 +379,7 @@
      */
     public String getName() {
         String osName = System.getProperty("os.name").split(" ")[0];
-        return getCPU().name().toLowerCase(LOCALE) + "-" + osName;
+        return getCPU().name().toLowerCase(LOCALE) + "-" + (osName.equals("MidnightBSD") ? "FreeBSD" : osName);
     }
 
     /**
