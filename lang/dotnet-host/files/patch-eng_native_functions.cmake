--- eng/native/functions.cmake.orig
+++ eng/native/functions.cmake
@@ -586,7 +586,7 @@
   # Disabling PAX hardening only makes sense in systems that use Elf image formats. Particularly, looking
   # for paxctl in macOS is problematic as it collides with popular software for that OS that performs completely
   # unrelated functionality. Only look for it when we'll generate Elf images.
-  if (CLR_CMAKE_HOST_LINUX OR CLR_CMAKE_HOST_FREEBSD OR CLR_CMAKE_HOST_NETBSD OR CLR_CMAKE_HOST_SUNOS)
+  if (CLR_CMAKE_HOST_LINUX OR CLR_CMAKE_HOST_FREEBSD OR CLR_CMAKE_HOST_NETBSD OR CLR_CMAKE_HOST_SUNOS OR CLR_CMAKE_HOST_MIDNIGHTBSD)
     # Try to locate the paxctl tool. Failure to find it is not fatal,
     # but the generated executables won't work on a system where PAX is set
     # to prevent applications to create executable memory mappings.
@@ -600,7 +600,7 @@
         COMMAND ${PAXCTL} -c -m $<TARGET_FILE:${targetName}>
         )
     endif()
-  endif(CLR_CMAKE_HOST_LINUX OR CLR_CMAKE_HOST_FREEBSD OR CLR_CMAKE_HOST_NETBSD OR CLR_CMAKE_HOST_SUNOS)
+  endif()
 endfunction()
 
 # add_linker_flag(Flag [Config1 Config2 ...])
