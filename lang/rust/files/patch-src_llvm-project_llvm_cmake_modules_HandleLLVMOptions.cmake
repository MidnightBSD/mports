--- src/llvm-project/llvm/cmake/modules/HandleLLVMOptions.cmake.orig	2019-09-09 14:30:53.000000000 -0400
+++ src/llvm-project/llvm/cmake/modules/HandleLLVMOptions.cmake	2021-12-28 17:49:54.259328000 -0500
@@ -169,7 +169,7 @@
 
 # Pass -Wl,-z,defs. This makes sure all symbols are defined. Otherwise a DSO
 # build might work on ELF but fail on MachO/COFF.
-if(NOT (${CMAKE_SYSTEM_NAME} MATCHES "Darwin|FreeBSD|OpenBSD|DragonFly|AIX" OR
+if(NOT (${CMAKE_SYSTEM_NAME} MATCHES "Darwin|FreeBSD|OpenBSD|MidnightBSD|DragonFly|AIX" OR
         WIN32 OR CYGWIN) AND
    NOT LLVM_USE_SANITIZER)
   set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} -Wl,-z,defs")
