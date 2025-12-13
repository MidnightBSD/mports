--- llvm/cmake/modules/AddLLVM.cmake.orig	2025-01-16 14:22:35.548222000 -0500
+++ llvm/cmake/modules/AddLLVM.cmake	2025-01-16 14:29:15.761903000 -0500
@@ -2322,7 +2322,7 @@
   elseif(UNIX)
     set(_build_rpath "\$ORIGIN/../lib${LLVM_LIBDIR_SUFFIX}" ${extra_libdir})
     set(_install_rpath "\$ORIGIN/../lib${LLVM_LIBDIR_SUFFIX}")
-    if(${CMAKE_SYSTEM_NAME} MATCHES "(FreeBSD|DragonFly)")
+    if(${CMAKE_SYSTEM_NAME} MATCHES "(MidnightBSD|FreeBSD|DragonFly)")
       set_property(TARGET ${name} APPEND_STRING PROPERTY
                    LINK_FLAGS " -Wl,-z,origin ")
     endif()
