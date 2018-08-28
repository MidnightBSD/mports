--- m4/libtool.m4.orig	2015-01-20 11:15:19.000000000 -0500
+++ m4/libtool.m4	2018-03-07 23:40:12.000000000 -0500
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
@@ -3488,7 +3488,7 @@
   lt_cv_deplibs_check_method=pass_all
   ;;
 
-freebsd* | dragonfly*)
+freebsd* | dragonfly* | midnightbsd*)
   if echo __ELF__ | $CC -E - | $GREP __ELF__ > /dev/null; then
     case $host_cpu in
     i*86 )
@@ -4317,7 +4317,7 @@
 	    ;;
 	esac
 	;;
-      freebsd* | dragonfly*)
+      freebsd* | dragonfly* | midnightbsd*)
 	# FreeBSD uses GNU C++
 	;;
       hpux9* | hpux10* | hpux11*)
@@ -5650,7 +5650,7 @@
       ;;
 
     # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
-    freebsd* | dragonfly*)
+    freebsd* | dragonfly* | midnightbsd*)
       _LT_TAGVAR(archive_cmds, $1)='$CC -shared $pic_flag -o $lib $libobjs $deplibs $compiler_flags'
       _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='-R$libdir'
       _LT_TAGVAR(hardcode_direct, $1)=yes
@@ -6760,7 +6760,7 @@
         _LT_TAGVAR(archive_cmds_need_lc, $1)=no
         ;;
 
-      freebsd* | dragonfly*)
+      freebsd* | dragonfly* | midnightbsd*)
         # FreeBSD 3 and later use GNU C++ and GNU ld with standard ELF
         # conventions
         _LT_TAGVAR(ld_shlibs, $1)=yes
