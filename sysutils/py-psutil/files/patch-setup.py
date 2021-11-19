--- setup.py.orig	2020-12-18 18:38:52.000000000 -0500
+++ setup.py	2021-11-19 13:08:49.679678000 -0500
@@ -422,7 +432,10 @@
                 print(hilite("XCode (https://developer.apple.com/xcode/) "
                              "is not installed"), color="red", file=sys.stderr)
             elif FREEBSD:
-                missdeps("pkg install gcc python%s" % py3)
+                if which('pkg'):
+                    missdeps("pkg install gcc python%s" % py3)
+                elif which('mport'):
+                    missdeps("mport install gcc python%s" % py3)
             elif OPENBSD:
                 missdeps("pkg_add -v gcc python%s" % py3)
             elif NETBSD:
