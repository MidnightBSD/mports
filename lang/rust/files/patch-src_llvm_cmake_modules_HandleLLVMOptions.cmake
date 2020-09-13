--- src/llvm/cmake/modules/HandleLLVMOptions.cmake.orig	2020-09-01 15:32:14.526168000 -0400
+++ src/llvm/cmake/modules/HandleLLVMOptions.cmake	2020-09-01 15:33:12.243652000 -0400
@@ -146,6 +146,7 @@
 # build might work on ELF but fail on MachO/COFF.
 if(NOT (${CMAKE_SYSTEM_NAME} MATCHES "Darwin" OR WIN32 OR CYGWIN OR
         ${CMAKE_SYSTEM_NAME} MATCHES "FreeBSD" OR
+        ${CMAKE_SYSTEM_NAME} MATCHES "MidnightBSD" OR
         ${CMAKE_SYSTEM_NAME} MATCHES "OpenBSD") AND
    NOT LLVM_USE_SANITIZER)
   set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} -Wl,-z,defs")
