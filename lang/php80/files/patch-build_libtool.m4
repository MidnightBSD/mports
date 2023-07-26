--- build/libtool.m4.orig	2023-03-13 19:06:57 UTC
+++ build/libtool.m4
@@ -843,7 +843,7 @@ AC_CACHE_VAL([lt_cv_sys_max_cmd_len], [d
     lt_cv_sys_max_cmd_len=8192;
     ;;
 
-  netbsd* | freebsd* | openbsd* | darwin* | dragonfly*)
+  netbsd* | freebsd* | openbsd* | darwin* | dragonfly* | midnightbsd*)
     # This has been around since 386BSD, at least.  Likely further.
     if test -x /sbin/sysctl; then
       lt_cv_sys_max_cmd_len=`/sbin/sysctl -n kern.argmax`
@@ -1535,7 +1535,7 @@ dgux*)
   shlibpath_var=LD_LIBRARY_PATH
   ;;
 
-freebsd* | dragonfly*)
+freebsd* | dragonfly* | midnightbsd*)
   # DragonFly does not have aout.  When/if they implement a new
   # versioning mechanism, adjust this.
   if test -x /usr/bin/objformat; then
@@ -2423,7 +2423,7 @@ darwin* | rhapsody*)
   lt_cv_deplibs_check_method=pass_all
   ;;
 
-freebsd* | dragonfly*)
+midnightbsd* | freebsd* | dragonfly*)
   if echo __ELF__ | $CC -E - | grep __ELF__ > /dev/null; then
     case $host_cpu in
     i*86 )
@@ -3166,7 +3166,7 @@ case $host_os in
   freebsd-elf*)
     _LT_AC_TAGVAR(archive_cmds_need_lc, $1)=no
     ;;
-  freebsd* | dragonfly*)
+  midnightbsd* | freebsd* | dragonfly*)
     # FreeBSD 3 and later use GNU C++ and GNU ld with standard ELF
     # conventions
     _LT_AC_TAGVAR(ld_shlibs, $1)=yes
@@ -4841,7 +4841,7 @@ AC_MSG_CHECKING([for $compiler option to
 	    ;;
 	esac
 	;;
-      freebsd* | dragonfly*)
+      midnightbsd* | freebsd* | dragonfly*)
 	# FreeBSD uses GNU C++
 	;;
       hpux9* | hpux10* | hpux11*)
@@ -5862,7 +5862,7 @@ _LT_EOF
       ;;
 
     # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
-    freebsd* | dragonfly*)
+    midnightbsd* | freebsd* | dragonfly*)
       _LT_AC_TAGVAR(archive_cmds, $1)='$CC -shared -o $lib $libobjs $deplibs $compiler_flags'
       _LT_AC_TAGVAR(hardcode_libdir_flag_spec, $1)='-R$libdir'
       _LT_AC_TAGVAR(hardcode_direct, $1)=yes
