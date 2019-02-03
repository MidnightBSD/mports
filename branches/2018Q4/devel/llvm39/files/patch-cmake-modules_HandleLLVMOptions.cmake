--- cmake/modules/HandleLLVMOptions.cmake.orig	2018-08-29 20:53:02.343548000 -0400
+++ cmake/modules/HandleLLVMOptions.cmake	2018-08-29 20:53:25.277917000 -0400
@@ -107,6 +107,7 @@
 # build might work on ELF but fail on MachO/COFF.
 if(NOT (${CMAKE_SYSTEM_NAME} MATCHES "Darwin" OR WIN32 OR CYGWIN OR
         ${CMAKE_SYSTEM_NAME} MATCHES "FreeBSD" OR
+	${CMAKE_SYSTEM_NAME} MATCHES "MidnightBSD" OR
         ${CMAKE_SYSTEM_NAME} MATCHES "OpenBSD") AND
    NOT LLVM_USE_SANITIZER)
   set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} -Wl,-z,defs")
