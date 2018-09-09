--- m4/libtool.m4.orig	2018-09-09 16:14:42.365161000 -0400
+++ m4/libtool.m4	2018-09-09 16:16:07.808592000 -0400
@@ -1638,7 +1638,7 @@
     lt_cv_sys_max_cmd_len=8192;
     ;;
 
-  netbsd* | freebsd* | openbsd* | darwin* | dragonfly*)
+  netbsd* | freebsd* | openbsd* | darwin* | dragonfly* | midnightbsd*)
     # This has been around since 386BSD, at least.  Likely further.
     if test -x /sbin/sysctl; then
       lt_cv_sys_max_cmd_len=`/sbin/sysctl -n kern.argmax`
@@ -2468,7 +2468,7 @@
   shlibpath_var=LD_LIBRARY_PATH
   ;;
 
-freebsd* | dragonfly*)
+freebsd* | dragonfly* | midnightbsd*)
   # DragonFly does not have aout.  When/if they implement a new
   # versioning mechanism, adjust this.
   if test -x /usr/bin/objformat; then
@@ -2486,7 +2486,7 @@
       need_version=no
       need_lib_prefix=no
       ;;
-    freebsd-*)
+    freebsd-* | midnightbsd*)
       library_names_spec='${libname}${release}${shared_ext}$versuffix $libname${shared_ext}$versuffix'
       need_version=yes
       ;;
@@ -3231,13 +3231,13 @@
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
@@ -3998,7 +3998,7 @@
 	    ;;
 	esac
 	;;
-      freebsd* | dragonfly*)
+      freebsd* | dragonfly* | midnightbsd*)
 	# FreeBSD uses GNU C++
 	;;
       hpux9* | hpux10* | hpux11*)
@@ -5212,7 +5212,7 @@
       ;;
 
     # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
-    freebsd* | dragonfly*)
+    freebsd* | dragonfly* | midnightbsd*)
       _LT_TAGVAR(archive_cmds, $1)='$CC -shared $pic_flag -o $lib $libobjs $deplibs $compiler_flags'
       _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='-R$libdir'
       _LT_TAGVAR(hardcode_direct, $1)=yes
@@ -6220,7 +6220,7 @@
         _LT_TAGVAR(archive_cmds_need_lc, $1)=no
         ;;
 
-      freebsd* | dragonfly*)
+      freebsd* | dragonfly* | midnightbsd*)
         # FreeBSD 3 and later use GNU C++ and GNU ld with standard ELF
         # conventions
         _LT_TAGVAR(ld_shlibs, $1)=yes
