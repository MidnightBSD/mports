--- src/llvm-project/llvm/cmake/modules/HandleLLVMOptions.cmake.orig	2019-04-02 15:19:15.000000000 -0400
+++ src/llvm-project/llvm/cmake/modules/HandleLLVMOptions.cmake	2021-12-13 14:13:19.750772000 -0500
@@ -138,6 +138,7 @@
 # build might work on ELF but fail on MachO/COFF.
 if(NOT (${CMAKE_SYSTEM_NAME} MATCHES "Darwin" OR WIN32 OR CYGWIN OR
         ${CMAKE_SYSTEM_NAME} MATCHES "FreeBSD" OR
+        ${CMAKE_SYSTEM_NAME} MATCHES "MidnightBSD" OR
 	${CMAKE_SYSTEM_NAME} MATCHES "OpenBSD" OR
 	${CMAKE_SYSTEM_NAME} MATCHES "DragonFly") AND
    NOT LLVM_USE_SANITIZER)
