--- llvm/cmake/modules/AddLLVM.cmake.orig
+++ llvm/cmake/modules/AddLLVM.cmake
@@ -2709,7 +2709,7 @@
       list(APPEND _build_rpath "\$ORIGIN/../lib${LLVM_LIBDIR_SUFFIX}/${LLVM_DEFAULT_TARGET_TRIPLE}")
       list(APPEND _install_rpath "\$ORIGIN/../lib${LLVM_LIBDIR_SUFFIX}/${LLVM_DEFAULT_TARGET_TRIPLE}")
     endif()
-    if("${CMAKE_SYSTEM_NAME}" MATCHES "(FreeBSD|DragonFly)")
+    if("${CMAKE_SYSTEM_NAME}" MATCHES "(MidnightBSD|FreeBSD|DragonFly)")
       set_property(TARGET ${name} APPEND_STRING PROPERTY
                    LINK_FLAGS " -Wl,-z,origin ")
     endif()
