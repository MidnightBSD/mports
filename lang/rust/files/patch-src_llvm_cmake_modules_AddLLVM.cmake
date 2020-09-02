--- src/llvm/cmake/modules/AddLLVM.cmake.orig	2020-09-01 15:32:40.531254000 -0400
+++ src/llvm/cmake/modules/AddLLVM.cmake	2020-09-01 15:32:52.805906000 -0400
@@ -1586,7 +1586,7 @@
     set(_install_rpath "@loader_path/../lib" ${extra_libdir})
   elseif(UNIX)
     set(_install_rpath "\$ORIGIN/../lib${LLVM_LIBDIR_SUFFIX}" ${extra_libdir})
-    if(${CMAKE_SYSTEM_NAME} MATCHES "(FreeBSD|DragonFly)")
+    if(${CMAKE_SYSTEM_NAME} MATCHES "(MidnightBSD|FreeBSD|DragonFly)")
       set_property(TARGET ${name} APPEND_STRING PROPERTY
                    LINK_FLAGS " -Wl,-z,origin ")
     elseif(${CMAKE_SYSTEM_NAME} STREQUAL "Linux" AND NOT LLVM_LINKER_IS_GOLD)
