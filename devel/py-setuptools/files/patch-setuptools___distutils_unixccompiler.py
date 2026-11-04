--- setuptools/_distutils/unixccompiler.py.orig	2024-04-30 20:11:27 UTC
+++ setuptools/_distutils/unixccompiler.py
@@ -298,6 +298,8 @@ class UnixCCompiler(CCompiler):
                 return "-L" + dir
         elif sys.platform[:7] == "freebsd":
             return "-Wl,-rpath=" + dir
+        elif sys.platform[:7] == "midnightbsd":
+            return "-Wl,-rpath=" + dir
         elif sys.platform[:5] == "hp-ux":
             return [
                 "-Wl,+s" if self._is_gcc() else "+s",
