--- cmake/modules/HandleLLVMOptions.cmake.orig	2019-12-11 14:15:30.000000000 -0500
+++ cmake/modules/HandleLLVMOptions.cmake	2023-03-07 12:41:24.416085000 -0500
@@ -191,7 +191,7 @@
 
 # Pass -Wl,-z,defs. This makes sure all symbols are defined. Otherwise a DSO
 # build might work on ELF but fail on MachO/COFF.
-if(NOT (${CMAKE_SYSTEM_NAME} MATCHES "Darwin|FreeBSD|OpenBSD|DragonFly|AIX" OR
+if(NOT (${CMAKE_SYSTEM_NAME} MATCHES "Darwin|MidnightBSD|FreeBSD|OpenBSD|DragonFly|AIX" OR
         WIN32 OR CYGWIN) AND
    NOT LLVM_USE_SANITIZER)
   set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} -Wl,-z,defs")
