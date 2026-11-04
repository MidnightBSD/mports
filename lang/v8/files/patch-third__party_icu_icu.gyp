--- third_party/icu/icu.gyp.orig	2021-09-12 15:25:14 UTC
+++ third_party/icu/icu.gyp
@@ -42,7 +42,7 @@
       ['OS=="win"', {
         'cflags': [ '/utf-8' ],
       }],
-      ['(OS=="linux" or OS=="freebsd" or OS=="openbsd" or OS=="solaris" \
+      ['(OS=="linux" or OS=="freebsd" or OS=="midnightbsd" or OS=="openbsd" or OS=="solaris" \
          or OS=="netbsd" or OS=="mac" or OS=="android" or OS=="qnx") and \
         (target_arch=="arm" or target_arch=="ia32" or \
          target_arch=="mipsel" or target_arch=="mips" or \
@@ -66,7 +66,7 @@
           }],
         ],
       }],
-      ['(OS=="linux" or OS=="freebsd" or OS=="openbsd" or OS=="solaris" \
+      ['(OS=="linux" or OS=="freebsd" or OS == "midnightbsd" or OS=="openbsd" or OS=="solaris" \
          or OS=="netbsd" or OS=="mac" or OS=="android" or OS=="qnx") and \
         (target_arch=="arm64" or target_arch=="x64" or \
          target_arch=="mips64el" or target_arch=="mips64" or \
