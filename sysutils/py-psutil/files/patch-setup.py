--- setup.py.orig	2020-02-18 12:45:01.000000000 -0500
+++ setup.py	2020-09-18 15:37:39.637893000 -0400
@@ -35,6 +35,7 @@
 from _common import AIX  # NOQA
 from _common import BSD  # NOQA
 from _common import FREEBSD  # NOQA
+from _common import MIDNIGHTBSD  # NOQA
 from _common import hilite  # NOQA
 from _common import LINUX  # NOQA
 from _common import MACOS  # NOQA
@@ -178,7 +179,7 @@
             '-framework', 'CoreFoundation', '-framework', 'IOKit'
         ])
 
-elif FREEBSD:
+elif FREEBSD or MIDNIGHTBSD:
     macros.append(("PSUTIL_FREEBSD", 1))
     ext = Extension(
         'psutil._psutil_bsd',
@@ -275,8 +276,18 @@
         define_macros=macros)
 
 else:
-    sys.exit('platform %s is not supported' % sys.platform)
-
+    macros.append(("PSUTIL_BSD", 1))
+    macros.append(("PSUTIL_FREEBSD", 1))
+    ext = Extension(
+        'psutil._psutil_bsd',
+        sources=sources + [
+            'psutil/_psutil_bsd.c',
+            'psutil/arch/freebsd/specific.c',
+            'psutil/arch/freebsd/sys_socks.c',
+            'psutil/arch/freebsd/proc_socks.c',
+        ],
+        define_macros=macros,
+        libraries=["devstat"])
 
 if POSIX:
     posix_extension = Extension(
@@ -405,6 +416,8 @@
                              "is not installed"), ok=False, file=sys.stderr)
             elif FREEBSD:
                 missdeps("pkg install gcc python%s" % py3)
+            elif MIDNIHTBSD:
+                missdeps("mport install gcc python%s" % py3)
             elif OPENBSD:
                 missdeps("pkg_add -v gcc python%s" % py3)
             elif NETBSD:
