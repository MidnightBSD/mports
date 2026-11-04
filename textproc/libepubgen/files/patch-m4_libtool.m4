--- m4/libtool.m4.orig	2024-03-19 21:12:17 UTC
+++ m4/libtool.m4
@@ -3491,13 +3491,13 @@ darwin* | rhapsody*)
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
@@ -4320,7 +4320,7 @@ m4_if([$1], [CXX], [
 	    ;;
 	esac
 	;;
-      freebsd* | dragonfly*)
+      freebsd* | dragonfly* | midnightbsd*)
 	# FreeBSD uses GNU C++
 	;;
       hpux9* | hpux10* | hpux11*)
@@ -6763,7 +6763,7 @@ if test yes != "$_lt_caught_CXX_error"; then
         _LT_TAGVAR(archive_cmds_need_lc, $1)=no
         ;;
 
-      freebsd* | dragonfly*)
+      freebsd* | dragonfly* | midnightbsd*)
         # FreeBSD 3 and later use GNU C++ and GNU ld with standard ELF
         # conventions
         _LT_TAGVAR(ld_shlibs, $1)=yes
