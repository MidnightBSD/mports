--- src/llvm-project/llvm/cmake/modules/HandleLLVMOptions.cmake.orig	2023-05-31 15:29:25.000000000 -0400
+++ src/llvm-project/llvm/cmake/modules/HandleLLVMOptions.cmake	2023-12-06 18:34:28.790699000 -0500
@@ -226,7 +226,7 @@
 
 # Pass -Wl,-z,defs. This makes sure all symbols are defined. Otherwise a DSO
 # build might work on ELF but fail on MachO/COFF.
-if(NOT (CMAKE_SYSTEM_NAME MATCHES "Darwin|FreeBSD|OpenBSD|DragonFly|AIX|OS390" OR
+if(NOT (CMAKE_SYSTEM_NAME MATCHES "Darwin|MidnightBSD|FreeBSD|OpenBSD|DragonFly|AIX|OS390" OR
         WIN32 OR CYGWIN) AND
    NOT LLVM_USE_SANITIZER)
   set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} -Wl,-z,defs")
