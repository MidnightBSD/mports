--- threads.xs.orig
+++ threads.xs
@@ -47,6 +47,10 @@
 # define CLANG_DIAG_RESTORE_DECL CLANG_DIAG_RESTORE dNOOP
 #endif

+#ifndef PL_no_mem
+#  define PL_no_mem "Out of memory!\n"
+#endif
+
 #ifdef USE_ITHREADS

 #ifdef __amigaos4__
