--- src/d8.gyp.orig	2016-12-27 19:26:58.000000000 -0500
+++ src/d8.gyp	2016-12-27 19:27:20.000000000 -0500
@@ -63,7 +63,7 @@
                 'd8_js2c',
               ],
             }],
-            ['(OS=="linux" or OS=="mac" or OS=="freebsd" or OS=="netbsd" \
+            ['(OS=="linux" or OS=="mac" or OS=="freebsd" or OS="midnightbsd" or OS=="netbsd" \
                or OS=="openbsd" or OS=="solaris" or OS=="android")', {
               'sources': [ 'd8-posix.cc', ]
             }],
