--- m4/libtool.m4.orig	2020-09-29 16:17:34 UTC
+++ m4/libtool.m4
@@ -1714,7 +1714,7 @@ AC_CACHE_VAL([lt_cv_sys_max_cmd_len], [d
     lt_cv_sys_max_cmd_len=8192;
     ;;
 
-  bitrig* | darwin* | dragonfly* | freebsd* | netbsd* | openbsd*)
+  bitrig* | darwin* | dragonfly* | freebsd* | netbsd* | openbsd* | midnightbsd*)
     # This has been around since 386BSD, at least.  Likely further.
     if test -x /sbin/sysctl; then
       lt_cv_sys_max_cmd_len=`/sbin/sysctl -n kern.argmax`
@@ -2655,7 +2655,7 @@ dgux*)
   shlibpath_var=LD_LIBRARY_PATH
   ;;
 
-freebsd* | dragonfly*)
+midnightbsd* | freebsd* | dragonfly*)
   # DragonFly does not have aout.  When/if they implement a new
   # versioning mechanism, adjust this.
   if test -x /usr/bin/objformat; then
@@ -2668,7 +2668,7 @@ freebsd* | dragonfly*)
   fi
   version_type=freebsd-$objformat
   case $version_type in
-    freebsd-elf*)
+    freebsd-elf*|midnightbsd-elf)
       library_names_spec='$libname$release$shared_ext$versuffix $libname$release$shared_ext$major $libname$shared_ext'
       soname_spec='$libname$release$shared_ext$major'
       need_version=no
@@ -3488,7 +3488,7 @@ darwin* | rhapsody*)
   lt_cv_deplibs_check_method=pass_all
   ;;
 
-freebsd* | dragonfly*)
+midnightbsd* | freebsd* | dragonfly*)
   if echo __ELF__ | $CC -E - | $GREP __ELF__ > /dev/null; then
     case $host_cpu in
     i*86 )
@@ -4317,7 +4317,7 @@ m4_if([$1], [CXX], [
 	    ;;
 	esac
 	;;
-      freebsd* | dragonfly*)
+      midnightbsd* | freebsd* | dragonfly*)
 	# FreeBSD uses GNU C++
 	;;
       hpux9* | hpux10* | hpux11*)
@@ -5650,7 +5650,7 @@ _LT_EOF
       ;;
 
     # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
-    freebsd* | dragonfly*)
+    midnightbsd* | freebsd* | dragonfly*)
       _LT_TAGVAR(archive_cmds, $1)='$CC -shared $pic_flag -o $lib $libobjs $deplibs $compiler_flags'
       _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='-R$libdir'
       _LT_TAGVAR(hardcode_direct, $1)=yes
@@ -6756,11 +6756,11 @@ if test yes != "$_lt_caught_CXX_error";
         _LT_TAGVAR(ld_shlibs, $1)=no
         ;;
 
-      freebsd-elf*)
+      midnightbsd-elf* | freebsd-elf*)
         _LT_TAGVAR(archive_cmds_need_lc, $1)=no
         ;;
 
-      freebsd* | dragonfly*)
+      midnightbsd* | freebsd* | dragonfly*)
         # FreeBSD 3 and later use GNU C++ and GNU ld with standard ELF
         # conventions
         _LT_TAGVAR(ld_shlibs, $1)=yes
