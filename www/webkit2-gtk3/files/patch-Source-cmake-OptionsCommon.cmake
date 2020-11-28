--- Source/cmake/OptionsCommon.cmake.orig	2020-08-12 09:17:57 UTC
+++ Source/cmake/OptionsCommon.cmake
@@ -137,7 +137,7 @@ WEBKIT_CHECK_HAVE_FUNCTION(HAVE_VASPRINT
 # Check for symbols
 WEBKIT_CHECK_HAVE_SYMBOL(HAVE_REGEX_H regexec regex.h)
 if (NOT (${CMAKE_SYSTEM_NAME} STREQUAL "Darwin"))
-WEBKIT_CHECK_HAVE_SYMBOL(HAVE_PTHREAD_MAIN_NP pthread_main_np pthread_np.h)
+#WEBKIT_CHECK_HAVE_SYMBOL(HAVE_PTHREAD_MAIN_NP pthread_main_np pthread_np.h)
 endif ()
 # Windows has signal.h but is missing symbols that are used in calls to signal.
 WEBKIT_CHECK_HAVE_SYMBOL(HAVE_SIGNAL_H SIGTRAP signal.h)
