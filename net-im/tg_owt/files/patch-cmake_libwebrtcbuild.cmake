-- MidnightBSD reports CMAKE_SYSTEM_NAME as "MidnightBSD", so the FreeBSD
-- branch never matched and WEBRTC_FREEBSD went undefined. That left
-- src/rtc_base/byte_order.h with no byte order functions, failing the
-- build with "Missing byte order functions for this arch." The same
-- define also gates the correct thread, CPU info and audio device code.
--- cmake/libwebrtcbuild.cmake.orig	2025-12-12 00:00:00 UTC
+++ cmake/libwebrtcbuild.cmake
@@ -96,7 +96,7 @@
         INTERFACE
             WEBRTC_LINUX
         )
-    elseif (CMAKE_SYSTEM_NAME STREQUAL "FreeBSD")
+    elseif (CMAKE_SYSTEM_NAME MATCHES "^(FreeBSD|MidnightBSD)$")
         target_compile_definitions(libwebrtcbuild
         INTERFACE
             WEBRTC_FREEBSD
