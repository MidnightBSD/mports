--- Source/WTF/wtf/PlatformGTK.cmake.orig	2020-11-28 20:31:35 UTC
+++ Source/WTF/wtf/PlatformGTK.cmake
@@ -50,7 +50,7 @@ if (CMAKE_SYSTEM_NAME MATCHES "Linux")
 
         unix/MemoryPressureHandlerUnix.cpp
     )
-elseif (CMAKE_SYSTEM_NAME MATCHES "FreeBSD")
+elseif (CMAKE_SYSTEM_NAME MATCHES "MidnightBSD")
     list(APPEND WTF_SOURCES
         generic/MemoryFootprintGeneric.cpp
 
