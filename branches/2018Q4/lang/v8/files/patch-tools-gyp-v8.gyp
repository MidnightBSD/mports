--- tools/gyp/v8.gyp.orig	2016-12-27 19:25:00.000000000 -0500
+++ tools/gyp/v8.gyp	2016-12-27 19:25:50.000000000 -0500
@@ -675,6 +675,17 @@
                 ],
               }
             ],
+            ['OS=="midnightbsd"', {
+                'link_settings': {
+                  'libraries': [
+                    '-L/usr/local/lib -lexecinfo',
+                ]},
+                'sources': [
+                  '../../src/platform-freebsd.cc',
+                  '../../src/platform-posix.cc'
+                ],
+              }
+            ],
             ['OS=="openbsd"', {
                 'link_settings': {
                   'libraries': [
