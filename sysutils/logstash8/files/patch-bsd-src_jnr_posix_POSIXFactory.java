--- bsd-src/jnr/posix/POSIXFactory.java.orig	2025-10-24 15:13:46 UTC
+++ bsd-src/jnr/posix/POSIXFactory.java
@@ -123,6 +123,7 @@
             case LINUX:
                 return loadLinuxPOSIX(handler);
 
+            case MIDNIGHTBSD:
             case FREEBSD:
                 return loadFreeBSDPOSIX(handler);
 
@@ -186,6 +187,7 @@
                 return new String[] { "socket", "nsl", STANDARD_C_LIBRARY_NAME};
 
             case DRAGONFLY:
+            case MIDNIGHTBSD:
             case FREEBSD:
             case NETBSD:
                 return new String[] {STANDARD_C_LIBRARY_NAME};
