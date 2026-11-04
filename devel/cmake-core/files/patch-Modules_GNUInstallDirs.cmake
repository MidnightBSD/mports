--- Modules/GNUInstallDirs.cmake.orig	2024-12-16 18:10:44.213150000 -0500
+++ Modules/GNUInstallDirs.cmake	2024-12-16 18:11:47.707111000 -0500
@@ -332,7 +332,7 @@
     "Info documentation (DATAROOTDIR/info)")
 endif()
 
-if(CMAKE_SYSTEM_NAME MATCHES "^(([^k].*)?BSD|DragonFly)$" AND NOT CMAKE_SYSTEM_NAME MATCHES "^(FreeBSD)$")
+if(CMAKE_SYSTEM_NAME MATCHES "^(([^k].*)?BSD|DragonFly)$" AND NOT CMAKE_SYSTEM_NAME MATCHES "^(MidnightBSD|FreeBSD)$")
   _GNUInstallDirs_cache_path_fallback(CMAKE_INSTALL_MANDIR "man"
     "Man documentation (man)")
 else()
@@ -405,6 +405,12 @@
     elseif("${CMAKE_INSTALL_PREFIX}" MATCHES "^/opt/" AND NOT "${CMAKE_INSTALL_PREFIX}" MATCHES "^/opt/homebrew/")
       if("${GGAID_dir}" STREQUAL "SYSCONFDIR" OR "${GGAID_dir}" STREQUAL "LOCALSTATEDIR" OR "${GGAID_dir}" STREQUAL "RUNSTATEDIR")
         set(${absvar} "/${${var}}${CMAKE_INSTALL_PREFIX}")
+      else()
+        set(${absvar} "${CMAKE_INSTALL_PREFIX}/${${var}}")
+      endif()
+    elseif(CMAKE_SYSTEM_NAME MATCHES "^MidnightBSD$")
+      if("${GGAID_dir}" STREQUAL "LOCALSTATEDIR")
+        set(${absvar} "/${${var}}")
       else()
         set(${absvar} "${CMAKE_INSTALL_PREFIX}/${${var}}")
       endif()
