--- m4/libtool.m4.orig	2022-09-19 05:58:44.000000000 -0400
+++ m4/libtool.m4	2022-12-28 11:24:18.953549000 -0500
@@ -2233,7 +2233,7 @@
       old_striplib="$STRIP -S"
       AC_MSG_RESULT([yes])
       ;;
-    freebsd*)
+    freebsd*|midnightbsd*)
       if $STRIP -V 2>&1 | $GREP "elftoolchain" >/dev/null; then
         old_striplib="$STRIP --strip-debug"
         striplib="$STRIP --strip-unneeded"
@@ -2688,13 +2688,13 @@
   fi
   version_type=freebsd-$objformat
   case $version_type in
-    freebsd-elf*)
+    midnightbsd-elf* | freebsd-elf*)
       library_names_spec='$libname$release$shared_ext$versuffix $libname$release$shared_ext$major $libname$shared_ext'
       soname_spec='$libname$release$shared_ext$major'
       need_version=no
       need_lib_prefix=no
       ;;
-    freebsd-*)
+    midnightbsd-* | freebsd-*)
       library_names_spec='$libname$release$shared_ext$versuffix $libname$shared_ext$versuffix'
       need_version=yes
       ;;
