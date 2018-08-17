--- m4/ltdl.m4.orig	2018-08-17 13:23:36.306529000 -0400
+++ m4/ltdl.m4	2018-08-17 13:23:48.981944000 -0400
@@ -473,7 +473,7 @@
     # If you are looking for one http://www.opendarwin.org/projects/dlcompat
     lt_cv_sys_dlopen_deplibs=yes
     ;;
-  freebsd* | dragonfly*)
+  freebsd* | dragonfly* | midnightbsd*)
     lt_cv_sys_dlopen_deplibs=yes
     ;;
   gnu* | linux* | k*bsd*-gnu | kopensolaris*-gnu)
