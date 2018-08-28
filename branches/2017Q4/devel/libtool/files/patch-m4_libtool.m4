--- m4/libtool.m4.orig	2013-10-25 19:37:46.000000000 -0400
+++ m4/libtool.m4	2014-12-17 23:00:30.234010328 -0500
@@ -1687,7 +1687,7 @@
     lt_cv_sys_max_cmd_len=8192;
     ;;
 
-  bitrig* | darwin* | dragonfly* | freebsd* | netbsd* | openbsd*)
+  bitrig* | darwin* | dragonfly* | midnightbsd* | freebsd* | netbsd* | openbsd*)
     # This has been around since 386BSD, at least.  Likely further.
     if test -x /sbin/sysctl; then
       lt_cv_sys_max_cmd_len=`/sbin/sysctl -n kern.argmax`
@@ -2533,7 +2533,7 @@
   shlibpath_var=LD_LIBRARY_PATH
   ;;
 
-freebsd* | dragonfly*)
+freebsd* | dragonfly* | midnightbsd*)
   # DragonFly does not have aout.  When/if they implement a new
   # versioning mechanism, adjust this.
   if test -x /usr/bin/objformat; then
@@ -2547,7 +2547,8 @@
   version_type=freebsd-$objformat
   case $version_type in
     freebsd-elf*)
-      library_names_spec='$libname$release$shared_ext$versuffix $libname$release$shared_ext $libname$shared_ext'
+      library_names_spec='$libname$release$shared_ext$versuffix $libname$release$shared_ext$major $libname$shared_ext'
+      soname_spec='$libname$release$shared_ext$major'
       need_version=no
       need_lib_prefix=no
       ;;
@@ -3289,7 +3290,7 @@
   lt_cv_deplibs_check_method=pass_all
   ;;
 
-freebsd* | dragonfly*)
+freebsd* | dragonfly* | midnightbsd*)
   if echo __ELF__ | $CC -E - | $GREP __ELF__ > /dev/null; then
     case $host_cpu in
     i*86 )
@@ -4105,7 +4106,7 @@
 	    ;;
 	esac
 	;;
-      freebsd* | dragonfly*)
+      freebsd* | dragonfly* | midnightbsd*)
 	# FreeBSD uses GNU C++
 	;;
       hpux9* | hpux10* | hpux11*)
@@ -5343,7 +5344,7 @@
       ;;
 
     # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
-    freebsd* | dragonfly*)
+    freebsd* | dragonfly* | midnightbsd*)
       _LT_TAGVAR(archive_cmds, $1)='$CC -shared $pic_flag -o $lib $libobjs $deplibs $compiler_flags'
       _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='-R$libdir'
       _LT_TAGVAR(hardcode_direct, $1)=yes
@@ -6344,7 +6345,7 @@
         _LT_TAGVAR(archive_cmds_need_lc, $1)=no
         ;;
 
-      freebsd* | dragonfly*)
+      freebsd* | dragonfly* | midnightbsd*)
         # FreeBSD 3 and later use GNU C++ and GNU ld with standard ELF
         # conventions
         _LT_TAGVAR(ld_shlibs, $1)=yes
