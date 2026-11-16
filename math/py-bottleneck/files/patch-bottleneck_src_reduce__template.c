--- bottleneck/src/reduce_template.c.orig	2025-09-08 16:21:25 UTC
+++ bottleneck/src/reduce_template.c
@@ -451,6 +451,7 @@ REDUCE_ONE(NAME, DTYPE0) {
     if (LENGTH == 0) {
         VALUE_ERR("numpy.NAME raises on a.shape[axis]==0; "
                   "So Bottleneck too.");
+        Py_DECREF(y);
         return NULL;
     }
     BN_BEGIN_ALLOW_THREADS
@@ -500,6 +501,7 @@ REDUCE_ONE(NAME, DTYPE0) {
     if (LENGTH == 0) {
         VALUE_ERR("numpy.NAME raises on a.shape[axis]==0; "
                   "So Bottleneck too.");
+        Py_DECREF(y);
         return NULL;
     }
     BN_BEGIN_ALLOW_THREADS
@@ -566,6 +568,7 @@ REDUCE_ONE(NAME, DTYPE0) {
     if (LENGTH == 0) {
         VALUE_ERR("numpy.NAME raises on a.shape[axis]==0; "
                   "So Bottleneck too.");
+        Py_DECREF(y);
         return NULL;
     }
     BN_BEGIN_ALLOW_THREADS
@@ -590,6 +593,7 @@ REDUCE_ONE(NAME, DTYPE0) {
     BN_END_ALLOW_THREADS
     if (err_code) {
         VALUE_ERR("All-NaN slice encountered");
+        Py_DECREF(y);
         return NULL;
     }
     return y;
@@ -627,6 +631,7 @@ REDUCE_ONE(NAME, DTYPE0) {
     if (LENGTH == 0) {
         VALUE_ERR("numpy.NAME raises on a.shape[axis]==0; "
                   "So Bottleneck too.");
+        Py_DECREF(y);
         return NULL;
     }
     BN_BEGIN_ALLOW_THREADS
