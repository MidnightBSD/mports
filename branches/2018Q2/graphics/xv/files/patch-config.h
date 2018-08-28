--- config.h.orig	Thu Aug 27 04:50:47 1998
+++ config.h	Thu Aug 27 04:51:05 1998
@@ -103,10 +103,9 @@
  * should not need to be changed
  */
 
-/* #define GS_PATH "/usr/local/bin/gs" */
-#define GS_PATH "gs"
-/* #define GS_LIB  "."                 */
-/* #define GS_DEV  "ppmraw"            */
+#define GS_PATH "%%LOCALBASE%%/bin/gs"
+#define GS_LIB  "%%LOCALBASE%%/lib/ghostscript"
+#define GS_DEV  "ppmraw"
 
 
 /***************************************************************************
@@ -159,7 +159,7 @@
  * in the following line.
  */
 
-#undef MACBINARY
+#define MACBINARY
 
 
 /***************************************************************************
@@ -175,8 +175,8 @@
  * is read-only), change 'undef' to 'define' the VIRTUAL_TD line.
  */
 
-#undef AUTO_EXPAND
-#undef VIRTUAL_TD
+#define AUTO_EXPAND
+#define VIRTUAL_TD
 
 #if !defined(AUTO_EXPAND) && defined(VIRTUAL_TD)
 #  undef VIRTUAL_TD
@@ -190,7 +190,7 @@
  * Shunauzer, change 'undef' to 'define' in the following line.
  */
 
-#undef VS_ADJUST
+#define VS_ADJUST
 
 
 /***************************************************************************
@@ -216,7 +216,7 @@
  * 'undef' to 'define' in the following line.
  */
 
-#undef TV_L10N
+/* #undef TV_L10N */
 
 #ifdef TV_L10N
 /*
@@ -259,7 +259,7 @@
  * magic number or suffix in "~/.xv_mgcsfx" .
  * To enable this feature, change 'undef' to 'define' in the following line.
  */
-#undef HAVE_MGCSFX
+#define HAVE_MGCSFX
 
 #ifdef HAVE_MGCSFX
 /*
@@ -285,14 +285,14 @@
  * WARNING : If you decide to use preprocessor, you must not write
  *           '# <comment>' style comment in startup file. Because,
  *           preprocessor can't recognize.  */
-#  undef USE_MGCSFX_PREPROCESSOR
+#  define USE_MGCSFX_PREPROCESSOR
 
 #  ifdef USE_MGCSFX_PREPROCESSOR
 /*
  * This is used like "system("MGCSFX_PREPROCESSOR MGCSFX_RC > tmp_name");",
  * and read tmp_name instead of MGCSFX_RC.
  */
-#    define MGCSFX_PREPROCESSOR "/usr/lib/cpp"
+#    define MGCSFX_PREPROCESSOR "/usr/bin/cpp"
 /* #    define MGCSFX_PREPROCESSOR "cc -E" */
 
 #  endif /* USE_MGCSFX_PREPROCESSOR */
@@ -325,7 +325,7 @@
  * 'undef' to 'define' in the following line.
  */
 
-#undef TV_MULTILINGUAL
+/* #undef TV_MULTILINGUAL */
 
 #define TV_DEFAULT_CODESET TV_EUC_JAPAN
 
