--- llvm/cmake/modules/AddLLVM.cmake.orig	2023-12-19 08:27:13.695060000 -0500
+++ llvm/cmake/modules/AddLLVM.cmake	2023-12-19 08:27:33.208132000 -0500
@@ -2103,7 +2103,7 @@
     set(_install_rpath "@loader_path/../lib${LLVM_LIBDIR_SUFFIX}" ${extra_libdir})
   elseif(UNIX)
     set(_install_rpath "\$ORIGIN/../lib${LLVM_LIBDIR_SUFFIX}" ${extra_libdir})
-    if(${CMAKE_SYSTEM_NAME} MATCHES "(FreeBSD|DragonFly)")
+    if(${CMAKE_SYSTEM_NAME} MATCHES "(MidnightBSD|FreeBSD|DragonFly)")
       set_property(TARGET ${name} APPEND_STRING PROPERTY
                    LINK_FLAGS " -Wl,-z,origin ")
     endif()
