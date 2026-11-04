--- bsd-src/com/kenai/jffi/internal/StubLoader.java.orig	2026-03-31 17:27:58 UTC
+++ bsd-src/com/kenai/jffi/internal/StubLoader.java
@@ -192,7 +192,7 @@
             return OS.IBMI;
         } else if (Util.startsWithIgnoreCase(osName, "openbsd", LOCALE)) {
             return OS.OPENBSD;
-        } else if (Util.startsWithIgnoreCase(osName, "freebsd", LOCALE)) {
+        } else if ((Util.startsWithIgnoreCase(osName, "freebsd", LOCALE) || Util.startsWithIgnoreCase(osName, "midnightbsd", LOCALE))) {
             return OS.FREEBSD;
 	} else if (Util.startsWithIgnoreCase(osName, "dragonfly", LOCALE)) {
             return OS.DRAGONFLY;
@@ -282,7 +282,7 @@
 
        
         String osName = System.getProperty("os.name").split(" ")[0];
-        return getCPU().name().toLowerCase(LOCALE) + "-" + osName;
+        return getCPU().name().toLowerCase(LOCALE) + "-" + (osName.equals("MidnightBSD") ? "FreeBSD" : osName);
     }
     /**
      * Gets the path within the jar file of the stub native library.
