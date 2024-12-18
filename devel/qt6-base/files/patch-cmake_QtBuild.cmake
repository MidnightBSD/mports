--- cmake/QtBuild.cmake.orig	2023-09-21 15:24:26.000000000 -0400
+++ cmake/QtBuild.cmake	2023-11-17 08:36:41.353333000 -0500
@@ -203,7 +203,7 @@
     if(QT_CONFIG_INSTALL_DIR)
         string(APPEND QT_CONFIG_INSTALL_DIR "/")
     endif()
-    string(APPEND QT_CONFIG_INSTALL_DIR ${__config_path_part})
+    string(APPEND QT_CONFIG_INSTALL_DIR "lib/cmake")
 
     set(QT_BUILD_DIR "${QT_BUILD_DIR}" PARENT_SCOPE)
     set(QT_INSTALL_DIR "${QT_INSTALL_DIR}" PARENT_SCOPE)
@@ -343,6 +343,12 @@
         set(QT_DEFAULT_MKSPEC freebsd-clang)
     elseif(GCC)
         set(QT_DEFAULT_MKSPEC freebsd-g++)
+    endif()
+elseif(MIDNIGHTBSD)
+    if(CLANG)
+        set(QT_DEFAULT_MKSPEC midnightbsd-clang)
+    elseif(GCC)
+        set(QT_DEFAULT_MKSPEC midnightbsd-g++)
     endif()
 elseif(NETBSD)
     set(QT_DEFAULT_MKSPEC netbsd-g++)
