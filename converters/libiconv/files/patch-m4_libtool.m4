--- m4/libtool.m4.orig	2022-05-15 07:58:54.000000000 -0400
+++ m4/libtool.m4	2023-01-10 23:16:54.299268000 -0500
@@ -2688,7 +2688,7 @@
   fi
   version_type=freebsd-$objformat
   case $version_type in
-    freebsd-elf*)
+    freebsd-elf*|midnightbsd-elf)
       library_names_spec='$libname$release$shared_ext$versuffix $libname$release$shared_ext$major $libname$shared_ext'
       soname_spec='$libname$release$shared_ext$major'
       need_version=no
