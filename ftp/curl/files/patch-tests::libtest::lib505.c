diff -urN -x .svn ../../vendor/curl/tests/libtest/lib505.c ./tests/libtest/lib505.c
--- ../../vendor/curl/tests/libtest/lib505.c	2008-09-22 00:15:55.000000000 +0300
+++ ./tests/libtest/lib505.c	2009-01-21 16:12:24.000000000 +0200
@@ -56,12 +56,24 @@
     return -1;
   }
 
+  /* get a FILE * of the same file, could also be made with
+     fdopen() from the previous descriptor, but hey this is just
+     an example! */
+  hd_src = fopen(libtest_arg2, "rb");
+  if(NULL == hd_src) {
+    error = ERRNO;
+    fprintf(stderr, "fopen() failed with error: %d %s\n",
+            error, strerror(error));
+    fprintf(stderr, "Error opening file: %s\n", libtest_arg2);
+    return -2; /* if this happens things are major weird */
+  }
+
   /* get the file size of the local file */
-  hd = stat(libtest_arg2, &file_info);
+  hd = fstat(fileno(hd_src), &file_info);
   if(hd == -1) {
     /* can't open file, bail out */
     error = ERRNO;
-    fprintf(stderr, "stat() failed with error: %d %s\n",
+    fprintf(stderr, "fstat() failed with error: %d %s\n",
             error, strerror(error));
     fprintf(stderr, "WARNING: cannot open file %s\n", libtest_arg2);
     return -1;
@@ -72,18 +84,6 @@
     return -4;
   }
 
-  /* get a FILE * of the same file, could also be made with
-     fdopen() from the previous descriptor, but hey this is just
-     an example! */
-  hd_src = fopen(libtest_arg2, "rb");
-  if(NULL == hd_src) {
-    error = ERRNO;
-    fprintf(stderr, "fopen() failed with error: %d %s\n",
-            error, strerror(error));
-    fprintf(stderr, "Error opening file: %s\n", libtest_arg2);
-    return -2; /* if this happens things are major weird */
-  }
-
   if (curl_global_init(CURL_GLOBAL_ALL) != CURLE_OK) {
     fprintf(stderr, "curl_global_init() failed\n");
     fclose(hd_src);
