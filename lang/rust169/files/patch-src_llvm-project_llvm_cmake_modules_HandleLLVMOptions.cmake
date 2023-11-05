--- src/llvm-project/llvm/cmake/modules/HandleLLVMOptions.cmake.orig	2021-11-16 11:47:26.000000000 -0500
+++ src/llvm-project/llvm/cmake/modules/HandleLLVMOptions.cmake	2021-12-30 10:33:33.324596000 -0500
@@ -228,7 +228,7 @@
 
 # Pass -Wl,-z,defs. This makes sure all symbols are defined. Otherwise a DSO
 # build might work on ELF but fail on MachO/COFF.
-if(NOT (CMAKE_SYSTEM_NAME MATCHES "Darwin|FreeBSD|OpenBSD|DragonFly|AIX|SunOS|OS390" OR
+if(NOT (CMAKE_SYSTEM_NAME MATCHES "Darwin|MidnightBSD|FreeBSD|OpenBSD|DragonFly|AIX|SunOS|OS390" OR
         WIN32 OR CYGWIN) AND
    NOT LLVM_USE_SANITIZER)
   set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} -Wl,-z,defs")
