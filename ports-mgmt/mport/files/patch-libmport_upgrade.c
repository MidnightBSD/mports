--- libmport/upgrade.c.orig	2026-09-21 18:52:13 UTC
+++ libmport/upgrade.c
@@ -48,7 +48,7 @@
 /*@-mustfreeonly -nullpass -nullret -nullstate -paramuse -predboolint -retvalint@*/
 /*@-temptrans -unrecog -usedef -varuse@*/
 
-#if defined(__MidnightBSD__) && __MidnightBSD_version >= 401002
+#if defined(__MidnightBSD__) && __MidnightBSD_version >= 402000
 static /*@null@*/ void *ecalloc(size_t, size_t, void *);
 static void efree(void *, void *);
 #else
@@ -57,7 +57,7 @@ static /*@null@*/ void *
 #endif
 
 static /*@null@*/ void *
-#if defined(__MidnightBSD__) && __MidnightBSD_version >= 401002
+#if defined(__MidnightBSD__) && __MidnightBSD_version >= 402000
 ecalloc(size_t nmemb, size_t size, void *data)
 #else
 ecalloc(size_t s1, void *data)
@@ -65,7 +65,7 @@ ecalloc(size_t s1, void *data)
 {
 	void *p;
 
-#if defined(__MidnightBSD__) && __MidnightBSD_version >= 401002
+#if defined(__MidnightBSD__) && __MidnightBSD_version >= 402000
 	if (!(p = calloc(nmemb, size)))
 		err(1, "calloc");
 #else
@@ -77,7 +77,7 @@ static void
 }
 
 static void
-#if defined(__MidnightBSD__) && __MidnightBSD_version >= 401002
+#if defined(__MidnightBSD__) && __MidnightBSD_version >= 402000
 efree(void *p, void *data)
 #else
 efree(void *p, size_t s1, void *data)
