--- projects/openmp/runtime/src/kmp_environment.cpp.orig	2023-01-25 18:33:21.902295000 -0500
+++ projects/openmp/runtime/src/kmp_environment.cpp	2023-01-25 18:33:38.847705000 -0500
@@ -62,7 +62,7 @@
 #include <crt_externs.h>
 #define environ (*_NSGetEnviron())
 #else
-extern char **environ;
+char **environ;
 #endif
 #elif KMP_OS_WINDOWS
 #include <windows.h> // GetEnvironmentVariable, SetEnvironmentVariable,
