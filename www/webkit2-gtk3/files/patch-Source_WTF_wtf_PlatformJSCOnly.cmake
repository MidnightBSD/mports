--- Source/WTF/wtf/PlatformJSCOnly.cmake.orig	2020-11-28 20:32:10 UTC
+++ Source/WTF/wtf/PlatformJSCOnly.cmake
@@ -100,7 +100,7 @@ elseif (CMAKE_SYSTEM_NAME MATCHES "Linux
         linux/ProcessMemoryFootprint.h
         linux/CurrentProcessMemoryStatus.h
     )
-elseif (CMAKE_SYSTEM_NAME MATCHES "FreeBSD")
+elseif (CMAKE_SYSTEM_NAME MATCHES "MidnightBSD")
     list(APPEND WTF_SOURCES
         generic/MemoryFootprintGeneric.cpp
 
