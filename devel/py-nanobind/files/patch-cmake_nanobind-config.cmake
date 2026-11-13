--- cmake/nanobind-config.cmake.orig
+++ cmake/nanobind-config.cmake
@@ -113,7 +113,10 @@
 # Probe for the faster TLSDESC thread-local storage ABI (Linux/x86_64)
 # ---------------------------------------------------------------------------
 
-if (NOT (MSVC OR WIN32 OR APPLE))
+if (CMAKE_SYSTEM_NAME STREQUAL "MidnightBSD")
+  # The MidnightBSD runtime linker does not support TLSDESC relocations.
+  set(NB_HAS_MTLS_GNU2 OFF)
+elseif (NOT (MSVC OR WIN32 OR APPLE))
   include(CheckCXXCompilerFlag)
   check_cxx_compiler_flag(-mtls-dialect=gnu2 NB_HAS_MTLS_GNU2)
 endif()
