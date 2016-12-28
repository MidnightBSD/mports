--- build/common.gypi.orig	2016-12-27 19:19:40.000000000 -0500
+++ build/common.gypi	2016-12-27 19:21:04.000000000 -0500
@@ -330,7 +330,7 @@
           },
         },
       }],
-      ['OS=="linux" or OS=="freebsd" or OS=="openbsd" or OS=="solaris" \
+      ['OS=="linux" or OS=="freebsd" or OS=="openbsd" or OS=="midnightbsd" or OS=="solaris" \
          or OS=="netbsd"', {
         'conditions': [
           [ 'v8_no_strict_aliasing==1', {
@@ -341,7 +341,7 @@
       ['OS=="solaris"', {
         'defines': [ '__C99FEATURES__=1' ],  # isinf() etc.
       }],
-      ['(OS=="linux" or OS=="freebsd" or OS=="openbsd" or OS=="solaris" \
+      ['(OS=="linux" or OS=="freebsd" or OS=="midnightbsd" or OS=="openbsd" or OS=="solaris" \
          or OS=="netbsd" or OS=="mac" or OS=="android") and \
         (v8_target_arch=="arm" or v8_target_arch=="ia32" or \
          v8_target_arch=="mipsel")', {
@@ -376,7 +376,7 @@
           }],
         ],
       }],
-      ['OS=="freebsd" or OS=="openbsd"', {
+      ['OS=="freebsd" or OS=="midnightbsd" or OS=="openbsd"', {
         'cflags': [ '-I/usr/local/include' ],
       }],
       ['OS=="netbsd"', {
@@ -415,7 +415,7 @@
           ['v8_enable_extra_checks==1', {
             'defines': ['ENABLE_EXTRA_CHECKS',],
           }],
-          ['OS=="linux" or OS=="freebsd" or OS=="openbsd" or OS=="netbsd"', {
+          ['OS=="linux" or OS=="freebsd" or OS=="midnightbsd" or OS=="openbsd" or OS=="netbsd"', {
             'cflags': [ '-Wall', '<(werror)', '-W', '-Wno-unused-parameter',
                         '-Wnon-virtual-dtor', '-Woverloaded-virtual' ],
           }],
@@ -452,7 +452,7 @@
           ['v8_enable_extra_checks==1', {
             'defines': ['ENABLE_EXTRA_CHECKS',],
           }],
-          ['OS=="linux" or OS=="freebsd" or OS=="openbsd" or OS=="netbsd" \
+          ['OS=="linux" or OS=="freebsd" or OS=="midnightbsd" or OS=="openbsd" or OS=="netbsd" \
             or OS=="android"', {
             'cflags!': [
               '-O2',
