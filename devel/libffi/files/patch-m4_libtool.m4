--- m4/libtool.m4.orig	2019-11-01 05:30:00.000000000 -0400
+++ m4/libtool.m4	2022-05-05 04:40:19.924848000 -0400
@@ -1714,7 +1714,7 @@
     lt_cv_sys_max_cmd_len=8192;
     ;;
 
-  bitrig* | darwin* | dragonfly* | freebsd* | netbsd* | openbsd*)
+  bitrig* | darwin* | dragonfly* | midnightbsd* | freebsd* | netbsd* | openbsd*)
     # This has been around since 386BSD, at least.  Likely further.
     if test -x /sbin/sysctl; then
       lt_cv_sys_max_cmd_len=`/sbin/sysctl -n kern.argmax`
@@ -2655,7 +2655,7 @@
   shlibpath_var=LD_LIBRARY_PATH
   ;;
 
-freebsd* | dragonfly*)
+freebsd* | dragonfly* | midnightbsd*)
   # DragonFly does not have aout.  When/if they implement a new
   # versioning mechanism, adjust this.
   if test -x /usr/bin/objformat; then
@@ -2668,13 +2668,13 @@
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
@@ -3491,13 +3491,13 @@
   lt_cv_deplibs_check_method=pass_all
   ;;
 
-freebsd* | dragonfly*)
+freebsd* | dragonfly* | midnightbsd*)
   if echo __ELF__ | $CC -E - | $GREP __ELF__ > /dev/null; then
     case $host_cpu in
     i*86 )
       # Not sure whether the presence of OpenBSD here was a mistake.
       # Let's accept both of them until this is cleared up.
-      lt_cv_deplibs_check_method='file_magic (FreeBSD|OpenBSD|DragonFly)/i[[3-9]]86 (compact )?demand paged shared library'
+      lt_cv_deplibs_check_method='file_magic (MidnightBSD|FreeBSD|OpenBSD|DragonFly)/i[[3-9]]86 (compact )?demand paged shared library'
       lt_cv_file_magic_cmd=/usr/bin/file
       lt_cv_file_magic_test_file=`echo /usr/lib/libc.so.*`
       ;;
@@ -4320,7 +4320,7 @@
 	    ;;
 	esac
 	;;
-      freebsd* | dragonfly*)
+      freebsd* | dragonfly* | midnightbsd*)
 	# FreeBSD uses GNU C++
 	;;
       hpux9* | hpux10* | hpux11*)
@@ -5653,7 +5653,7 @@
       ;;
 
     # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
-    freebsd* | dragonfly*)
+    freebsd* | dragonfly* | midnightbsd*)
       _LT_TAGVAR(archive_cmds, $1)='$CC -shared $pic_flag -o $lib $libobjs $deplibs $compiler_flags'
       _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='-R$libdir'
       _LT_TAGVAR(hardcode_direct, $1)=yes
@@ -6759,11 +6759,11 @@
         _LT_TAGVAR(ld_shlibs, $1)=no
         ;;
 
-      freebsd-elf*)
+      midnightbsd-elf*|freebsd-elf*)
         _LT_TAGVAR(archive_cmds_need_lc, $1)=no
         ;;
 
-      freebsd* | dragonfly*)
+      freebsd* | dragonfly* | midnightbsd*)
         # FreeBSD 3 and later use GNU C++ and GNU ld with standard ELF
         # conventions
         _LT_TAGVAR(ld_shlibs, $1)=yes
