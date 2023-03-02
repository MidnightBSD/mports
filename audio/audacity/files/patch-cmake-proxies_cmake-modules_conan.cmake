--- cmake-proxies/cmake-modules/conan.cmake.orig	2023-03-02 21:24:34 UTC
+++ cmake-proxies/cmake-modules/conan.cmake
@@ -94,7 +94,7 @@ macro(_conan_check_system_name)
         if(${CMAKE_SYSTEM_NAME} STREQUAL "QNX")
             set(CONAN_SYSTEM_NAME Neutrino)
         endif()        
-        set(CONAN_SUPPORTED_PLATFORMS Windows Linux Macos Android iOS FreeBSD WindowsStore WindowsCE watchOS tvOS FreeBSD SunOS AIX Arduino Emscripten Neutrino CYGWIN)
+        set(CONAN_SUPPORTED_PLATFORMS Windows Linux Macos Android iOS MidnightBSD FreeBSD WindowsStore WindowsCE watchOS tvOS FreeBSD SunOS AIX Arduino Emscripten Neutrino CYGWIN)
         list (FIND CONAN_SUPPORTED_PLATFORMS "${CONAN_SYSTEM_NAME}" _index)
         if (${_index} GREATER -1)
             #check if the cmake system is a conan supported one
