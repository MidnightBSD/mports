--- src/llvm-project/llvm/cmake/modules/AddLLVM.cmake.orig	2026-04-14 11:23:49 UTC
+++ src/llvm-project/llvm/cmake/modules/AddLLVM.cmake
@@ -2565,7 +2565,7 @@
   elseif(UNIX)
     set(_build_rpath "\$ORIGIN/../lib${LLVM_LIBDIR_SUFFIX}" ${extra_libdir})
     set(_install_rpath "\$ORIGIN/../lib${LLVM_LIBDIR_SUFFIX}")
-    if("${CMAKE_SYSTEM_NAME}" MATCHES "(FreeBSD|DragonFly)")
+    if("${CMAKE_SYSTEM_NAME}" MATCHES "(MidnightBSD|FreeBSD|DragonFly)")
       set_property(TARGET ${name} APPEND_STRING PROPERTY
                    LINK_FLAGS " -Wl,-z,origin ")
     endif()
