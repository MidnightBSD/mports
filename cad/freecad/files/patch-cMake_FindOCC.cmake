OCCT built with TBB exports HAVE_TBB in its compile definitions, which makes
Mod/Import use tbb::task_group directly, but nothing links libtbb.  With
-Wl,--no-undefined the Import module then fails to link.  Link TBB whenever
the OpenCASCADE config reports it was built with TBB.

--- cMake/FindOCC.cmake.orig	2026-07-01 13:44:31 UTC
+++ cMake/FindOCC.cmake
@@ -140,6 +140,11 @@ if (OCC_FOUND)
     else ()
         list(APPEND OCC_LIBRARIES TKDESTEP TKDEIGES TKDEGLTF TKDESTL)
     endif ()
+    if (OpenCASCADE_WITH_TBB)
+        find_package(TBB REQUIRED)
+        list(APPEND OCC_LIBRARIES TBB::tbb)
+        list(APPEND OCC_OCAF_LIBRARIES TBB::tbb)
+    endif ()
     message(STATUS "Found OpenCASCADE version: ${OCC_VERSION_STRING}")
     message(STATUS "  OpenCASCADE include directory: ${OCC_INCLUDE_DIR}")
     message(STATUS "  OpenCASCADE shared libraries directory: ${OCC_LIBRARY_DIR}")
