--- cmake_admin/DefaultDirs.cmake.orig	2022-05-31 14:28:39.994681000 -0400
+++ cmake_admin/DefaultDirs.cmake	2022-05-31 14:28:51.196135000 -0400
@@ -58,7 +58,7 @@
 mark_as_advanced (INFO_INSTALL_DIR) 
 
 # MAN_INSTALL_DIR - the man pages install dir
-if ( CMAKE_SYSTEM_NAME MATCHES "FreeBSD|DragonFly")
+if ( CMAKE_SYSTEM_NAME MATCHES "MidnightBSD|FreeBSD|DragonFly")
   set (MAN_INSTALL_DIR "man/man1" CACHE STRING "The man pages install dir")
 else()
   set (MAN_INSTALL_DIR "share/man/man1" CACHE STRING "The man pages install dir")
