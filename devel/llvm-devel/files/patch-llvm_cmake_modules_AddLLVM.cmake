--- llvm/cmake/modules/AddLLVM.cmake.orig	2026-10-13 10:01:55.000000000 -0400
+++ llvm/cmake/modules/AddLLVM.cmake	2026-11-13 00:24:26.067584000 -0500
@@ -2873,7 +2873,7 @@
       list(APPEND _build_rpath "\$ORIGIN/../lib${LLVM_LIBDIR_SUFFIX}/${LLVM_DEFAULT_TARGET_TRIPLE}")
       list(APPEND _install_rpath "\$ORIGIN/../lib${LLVM_LIBDIR_SUFFIX}/${LLVM_DEFAULT_TARGET_TRIPLE}")
     endif()
-    if("${CMAKE_SYSTEM_NAME}" MATCHES "(FreeBSD|DragonFly)")
+    if("${CMAKE_SYSTEM_NAME}" MATCHES "(MidnightBSD|FreeBSD|DragonFly)")
       set_property(TARGET ${name} APPEND_STRING PROPERTY
                    LINK_FLAGS " -Wl,-z,origin ")
     endif()
