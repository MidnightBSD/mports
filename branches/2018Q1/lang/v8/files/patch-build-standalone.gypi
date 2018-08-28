--- build/standalone.gypi.orig	2016-12-27 19:19:46.000000000 -0500
+++ build/standalone.gypi	2016-12-27 19:21:53.000000000 -0500
@@ -38,7 +38,7 @@
       'variables': {
         'variables': {
           'conditions': [
-            ['OS=="linux" or OS=="freebsd" or OS=="openbsd" or \
+            ['OS=="linux" or OS=="freebsd" or OS=="midnightbsd" or OS=="openbsd" or \
                OS=="netbsd" or OS=="mac"', {
               # This handles the Unix platforms we generally deal with.
               # Anything else gets passed through, which probably won't work
@@ -94,7 +94,7 @@
     },
   },
   'conditions': [
-    ['OS=="linux" or OS=="freebsd" or OS=="openbsd" or OS=="solaris" \
+    ['OS=="linux" or OS=="freebsd" or OS=="midnightbsd" or OS=="openbsd" or OS=="solaris" \
        or OS=="netbsd"', {
       'target_defaults': {
         'cflags': [ '-Wall', '<(werror)', '-W', '-Wno-unused-parameter',
