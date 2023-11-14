--- kde-modules/KDEMetaInfoPlatformCheck.cmake.bak	2023-09-15 20:13:18.000000000 -0400
+++ kde-modules/KDEMetaInfoPlatformCheck.cmake	2023-11-12 11:11:33.545028000 -0500
@@ -38,10 +38,20 @@
                 if (CMAKE_SYSTEM_NAME MATCHES "Linux")
                     set(_MetainfoFoundSupportedPlatform true)
                 endif()
-            elseif (${CMAKE_MATCH_1} STREQUAL "FreeBSD")
+            elseif (${CMAKE_MATCH_1} STREQUAL "MidnightBSD")
+                if (CMAKE_SYSTEM_NAME MATCHES "MidnightBSD")
+                    set(_MetainfoFoundSupportedPlatform true)
+                endif()
                 if (CMAKE_SYSTEM_NAME MATCHES "FreeBSD")
                     set(_MetainfoFoundSupportedPlatform true)
+		endif()
+            elseif (${CMAKE_MATCH_1} STREQUAL "FreeBSD")
+                if (CMAKE_SYSTEM_NAME MATCHES "MidnightBSD")
+                    set(_MetainfoFoundSupportedPlatform true)
                 endif()
+                if (CMAKE_SYSTEM_NAME MATCHES "FreeBSD")
+                    set(_MetainfoFoundSupportedPlatform true)
+		endif()
             elseif (${CMAKE_MATCH_1} STREQUAL "OpenBSD")
                 if (CMAKE_SYSTEM_NAME MATCHES "OpenBSD")
                     set(_MetainfoFoundSupportedPlatform true)