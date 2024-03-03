--- cmake/modules/HandleLLVMOptions.cmake.orig	2023-03-07 12:19:00.840674000 -0500
+++ cmake/modules/HandleLLVMOptions.cmake	2023-03-07 12:19:58.169038000 -0500
@@ -181,7 +181,7 @@
 
 # Pass -Wl,-z,defs. This makes sure all symbols are defined. Otherwise a DSO
 # build might work on ELF but fail on MachO/COFF.
-if(NOT (${CMAKE_SYSTEM_NAME} MATCHES "Darwin|FreeBSD|OpenBSD|DragonFly|AIX|SunOS" OR
+if(NOT (${CMAKE_SYSTEM_NAME} MATCHES "Darwin|MidnightBSD|FreeBSD|OpenBSD|DragonFly|AIX|SunOS" OR
         WIN32 OR CYGWIN) AND
    NOT LLVM_USE_SANITIZER)
   set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} -Wl,-z,defs")
