--- lib/iconv.c.orig	2018-09-17 16:07:16 UTC
+++ lib/iconv.c
@@ -602,7 +602,7 @@ int _libiconv_version = _LIBICONV_VERSIO
    It wants to define the symbols 'iconv_open', 'iconv', 'iconv_close'.  */
 #define strong_alias(name, aliasname) _strong_alias(name, aliasname)
 #define _strong_alias(name, aliasname) \
-  extern __typeof (name) aliasname __attribute__ ((alias (#name)));
+  extern LIBICONV_DLL_EXPORTED __typeof (name) aliasname __attribute__ ((alias (#name)));
 #undef iconv_open
 #undef iconv
 #undef iconv_close
