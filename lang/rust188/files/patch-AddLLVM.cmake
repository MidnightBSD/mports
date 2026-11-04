--- src/llvm-project/llvm/cmake/modules/AddLLVM.cmake.orig	2025-11-28 15:50:47.187034000 -0500
+++ src/llvm-project/llvm/cmake/modules/AddLLVM.cmake	2025-11-28 15:51:04.988563000 -0500
@@ -2466,7 +2466,7 @@
   elseif(UNIX)
     set(_build_rpath "\$ORIGIN/../lib${LLVM_LIBDIR_SUFFIX}" ${extra_libdir})
     set(_install_rpath "\$ORIGIN/../lib${LLVM_LIBDIR_SUFFIX}")
-    if(${CMAKE_SYSTEM_NAME} MATCHES "(FreeBSD|DragonFly)")
+    if(${CMAKE_SYSTEM_NAME} MATCHES "(MidnightBSD|FreeBSD|DragonFly)")
       set_property(TARGET ${name} APPEND_STRING PROPERTY
                    LINK_FLAGS " -Wl,-z,origin ")
     endif()
