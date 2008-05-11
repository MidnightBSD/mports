diff -urN -urN -x .svn ../../vendor/curl/tests/libtest/lib541.c ./tests/libtest/lib541.c
--- ../../vendor/curl/tests/libtest/lib541.c	2008-03-20 15:26:14.000000000 +0200
+++ ./tests/libtest/lib541.c	2008-04-02 13:21:49.000000000 +0300
@@ -46,12 +46,24 @@
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
@@ -62,18 +74,6 @@
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
