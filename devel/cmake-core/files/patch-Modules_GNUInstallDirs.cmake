--- Modules/GNUInstallDirs.cmake.orig	2023-03-08 10:01:06.000000000 -0500
+++ Modules/GNUInstallDirs.cmake	2024-07-31 23:52:09.163544000 -0400
@@ -332,7 +332,7 @@
     "Info documentation (DATAROOTDIR/info)")
 endif()
 
-if(CMAKE_SYSTEM_NAME MATCHES "^(([^k].*)?BSD|DragonFly)$" AND NOT CMAKE_SYSTEM_NAME MATCHES "^(FreeBSD)$")
+if(CMAKE_SYSTEM_NAME MATCHES "^(([^k].*)?BSD|DragonFly)$" AND NOT CMAKE_SYSTEM_NAME MATCHES "^(MidnightBSD)$")
   _GNUInstallDirs_cache_path_fallback(CMAKE_INSTALL_MANDIR "man"
     "Man documentation (man)")
 else()
