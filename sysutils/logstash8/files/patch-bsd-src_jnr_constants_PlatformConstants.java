--- bsd-src/jnr/constants/PlatformConstants.java.orig	2022-11-15 12:13:22 UTC
+++ bsd-src/jnr/constants/PlatformConstants.java
@@ -100,7 +100,7 @@
         if (osname.startsWith("windows")) {
             return "windows";
         }
-        return osname;
+        return osname.equals("midnightbsd") ? "freebsd" : osname;
     }
 
     private static final String initArchitecture() {
