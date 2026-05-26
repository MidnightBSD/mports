--- cmake/modules/FindLibDvdCSS.cmake.orig	2025-12-12 00:02:55 UTC
+++ cmake/modules/FindLibDvdCSS.cmake
@@ -49,7 +49,7 @@ if(NOT TARGET LibDvdCSS::LibDvdCSS)
                    ${LIBDVD_ADDITIONAL_ARGS})
   else()
     find_program(AUTORECONF autoreconf REQUIRED)
-    if (CMAKE_HOST_SYSTEM_NAME MATCHES "(Free|Net|Open)BSD")
+    if (CMAKE_HOST_SYSTEM_NAME MATCHES "(Free|Net|Open|Midnight)BSD")
       find_program(MAKE_EXECUTABLE gmake)
     endif()
     find_program(MAKE_EXECUTABLE make REQUIRED)
