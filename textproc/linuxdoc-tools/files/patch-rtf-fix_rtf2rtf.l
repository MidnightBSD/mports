--- rtf-fix/rtf2rtf.l.orig	2026-01-13 09:41:03.000000000 -0500
+++ rtf-fix/rtf2rtf.l	2026-07-05 22:37:00.000000000 -0400
@@ -74,14 +74,7 @@
 int skipnewline = 0;
 
 extern char *yytext;
-
-#if   YY_FLEX_MAJOR_VERSION > 2 \
- ||  (YY_FLEX_MAJOR_VERSION == 2 && YY_FLEX_MINOR_VERSION > 5) \
- ||  (YY_FLEX_MAJOR_VERSION == 2 && YY_FLEX_MINOR_VERSION == 5 && YY_FLEX_SUBMINOR_VERSION > 35)
-extern yy_size_t yyleng;
-#else
 extern int yyleng;
-#endif
 
 #define CHAPTER 1
 #define SECTION 2
