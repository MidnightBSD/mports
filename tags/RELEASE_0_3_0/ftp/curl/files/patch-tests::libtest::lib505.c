Description: Use fstat() instead of stat() to avoid a race condition.
Forwarded: not-needed
Author: Peter Pentchev <roam@FreeBSD.org>
Last-Update: 2010-03-30

--- tests/libtest/lib505.c
+++ tests/libtest/lib505.c
@@ -55,12 +55,24 @@
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
@@ -71,18 +83,6 @@
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
