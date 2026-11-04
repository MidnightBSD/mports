--- src/modules/perl/modperl_common_util.c.orig	2026-06-05 17:03:13.555690000 -0400
+++ src/modules/perl/modperl_common_util.c	2026-06-05 17:03:13.556889000 -0400
@@ -41,7 +41,7 @@
 
 MP_INLINE static
 int modperl_table_magic_copy(pTHX_ SV *sv, MAGIC *mg, SV *nsv,
-                             const char *name, int namelen)
+                             const char *name, I32 namelen)
 {
     /* prefetch the value whenever we're iterating over the keys */
     MAGIC *tie_magic = mg_find(nsv, PERL_MAGIC_tiedelem);
