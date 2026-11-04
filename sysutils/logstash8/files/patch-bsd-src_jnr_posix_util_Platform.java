--- bsd-src/jnr/posix/util/Platform.java.orig	2025-10-24 15:13:46 UTC
+++ bsd-src/jnr/posix/util/Platform.java
@@ -67,7 +67,7 @@
     public static final boolean IS_WINDOWS_SERVER = IS_WINDOWS && OS_NAME_LC.indexOf(WINDOWS_SERVER) > -1;
     public static final boolean IS_WINDOWS_7 = IS_WINDOWS && OS_NAME_LC.indexOf(WINDOWS_7) > -1;
     public static final boolean IS_MAC = OS_NAME_LC.startsWith(MAC_OS) || OS_NAME_LC.startsWith(DARWIN);
-    public static final boolean IS_FREEBSD = OS_NAME_LC.startsWith(FREEBSD);
+    public static final boolean IS_FREEBSD = OS_NAME_LC.startsWith(FREEBSD) || OS_NAME_LC.startsWith("midnightbsd");
     public static final boolean IS_DRAGONFLY = OS_NAME_LC.startsWith(DRAGONFLY);
     public static final boolean IS_OPENBSD = OS_NAME_LC.startsWith(OPENBSD);
     public static final boolean IS_LINUX = OS_NAME_LC.startsWith(LINUX);   
