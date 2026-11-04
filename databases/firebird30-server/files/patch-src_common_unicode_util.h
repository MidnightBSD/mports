--- src/common/unicode_util.h.orig
+++ src/common/unicode_util.h
@@ -36,6 +36,8 @@
 
 #undef U_SHOW_CPLUSPLUS_API
 #define U_SHOW_CPLUSPLUS_API 0
+#undef U_SHOW_CPLUSPLUS_HEADER_API
+#define U_SHOW_CPLUSPLUS_HEADER_API 0
 
 #include <unicode/ucnv.h>
 
