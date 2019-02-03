--- Lib/distutils/unixccompiler.py.orig	2018-04-29 18:47:33.000000000 -0400
+++ Lib/distutils/unixccompiler.py	2018-10-15 17:52:46.714118000 -0400
@@ -232,6 +232,8 @@
             return "-L" + dir
         elif sys.platform[:7] == "freebsd":
             return "-Wl,-rpath=" + dir
+        elif sys.platform[:7] == "midnightbsd":
+            return "-Wl,-rpath=" + dir
         elif sys.platform[:5] == "hp-ux":
             if self._is_gcc(compiler):
                 return ["-Wl,+s", "-L" + dir]
