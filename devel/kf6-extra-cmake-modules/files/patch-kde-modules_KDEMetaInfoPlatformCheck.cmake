--- kde-modules/KDEMetaInfoPlatformCheck.cmake.orig	2025-03-07 14:23:49 UTC
+++ kde-modules/KDEMetaInfoPlatformCheck.cmake
@@ -42,6 +42,10 @@ if (NOT "${KF_IGNORE_PLATFORM_CHECK}")
                 if (CMAKE_SYSTEM_NAME MATCHES "FreeBSD")
                     set(_MetainfoFoundSupportedPlatform true)
                 endif()
+            elseif (${CMAKE_MATCH_1} STREQUAL "MidnightBSD")
+                if (CMAKE_SYSTEM_NAME MATCHES "MidnightBSD")
+                    set(_MetainfoFoundSupportedPlatform true)
+                endif()
             elseif (${CMAKE_MATCH_1} STREQUAL "OpenBSD")
                 if (CMAKE_SYSTEM_NAME MATCHES "OpenBSD")
                     set(_MetainfoFoundSupportedPlatform true)
