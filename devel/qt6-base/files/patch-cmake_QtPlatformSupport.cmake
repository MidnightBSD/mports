--- cmake/QtPlatformSupport.cmake.orig	2025-01-02 17:52:25.485542000 -0500
+++ cmake/QtPlatformSupport.cmake	2025-01-02 17:52:37.424830000 -0500
@@ -17,6 +17,7 @@
 qt_set01(QNX CMAKE_SYSTEM_NAME STREQUAL "QNX") # FIXME: How to identify this?
 qt_set01(OPENBSD CMAKE_SYSTEM_NAME STREQUAL "OpenBSD") # FIXME: How to identify this?
 qt_set01(FREEBSD CMAKE_SYSTEM_NAME STREQUAL "FreeBSD") # FIXME: How to identify this?
+qt_set01(FREEBSD CMAKE_SYSTEM_NAME STREQUAL "MidnightBSD") # FIXME: How to identify this?
 qt_set01(NETBSD CMAKE_SYSTEM_NAME STREQUAL "NetBSD") # FIXME: How to identify this?
 qt_set01(WASM CMAKE_SYSTEM_NAME STREQUAL "Emscripten" OR EMSCRIPTEN)
 qt_set01(WASM64 QT_QMAKE_TARGET_MKSPEC STREQUAL "wasm-emscripten-64")
