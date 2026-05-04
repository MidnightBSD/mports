--- llvm/cmake/modules/HandleLLVMOptions.cmake.orig	2025-01-16 14:22:47.559283000 -0500
+++ llvm/cmake/modules/HandleLLVMOptions.cmake	2026-04-30 00:00:00.000000000 -0400
@@ -313,7 +313,7 @@
 # Pass -Wl,-z,defs. This makes sure all symbols are defined. Otherwise a DSO
 # build might work on ELF but fail on MachO/COFF.
-if(NOT (CMAKE_SYSTEM_NAME MATCHES "Darwin|FreeBSD|OpenBSD|DragonFly|AIX|OS390|Emscripten" OR
+if(NOT (CMAKE_SYSTEM_NAME MATCHES "Darwin|MidnightBSD|FreeBSD|OpenBSD|DragonFly|AIX|OS390|Emscripten" OR
         WIN32 OR CYGWIN) AND
    NOT LLVM_USE_SANITIZER)
   set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} -Wl,-z,defs")
