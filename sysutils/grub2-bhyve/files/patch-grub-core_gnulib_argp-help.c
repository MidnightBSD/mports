--- grub-core/gnulib/argp-help.c.orig	2019-10-17 10:29:27 UTC
+++ grub-core/gnulib/argp-help.c
@@ -48,6 +48,8 @@
 #include "argp-fmtstream.h"
 #include "argp-namefrob.h"
 
+size_t __argp_get_display_len (const char *, const char *);
+
 #ifndef SIZE_MAX
 # define SIZE_MAX ((size_t) -1)
 #endif
