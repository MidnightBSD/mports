--- cmake/modules/AddLLVM.cmake.orig	2018-08-29 20:52:53.936091000 -0400
+++ cmake/modules/AddLLVM.cmake	2018-08-29 20:53:52.910763000 -0400
@@ -1423,7 +1423,7 @@
     set(_install_rpath "@loader_path/../lib" ${extra_libdir})
   elseif(UNIX)
     set(_install_rpath "\$ORIGIN/../lib${LLVM_LIBDIR_SUFFIX}" ${extra_libdir})
-    if(${CMAKE_SYSTEM_NAME} MATCHES "(FreeBSD|DragonFly)")
+    if(${CMAKE_SYSTEM_NAME} MATCHES "(FreeBSD|DragonFly|MidnightBSD)")
       set_property(TARGET ${name} APPEND_STRING PROPERTY
                    LINK_FLAGS " -Wl,-z,origin ")
     elseif(${CMAKE_SYSTEM_NAME} STREQUAL "Linux" AND NOT LLVM_LINKER_IS_GOLD)
