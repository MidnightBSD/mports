--- srcm4/relocatable.m4.orig	2020-09-29 16:21:07 UTC
+++ srcm4/relocatable.m4
@@ -69,9 +69,9 @@ AC_DEFUN([gl_RELOCATABLE_BODY],
         ;;
 changequote(,)dnl
       # FreeBSD >= 7.3, DragonFly >= 3.0: yes.
-      freebsd | freebsd[1-7] | freebsd[1-6].* | freebsd7.[0-2]) ;;
+      midnightbsd | freebsd | freebsd[1-7] | freebsd[1-6].* | freebsd7.[0-2]) ;;
       dragonfly | dragonfly[1-2] | dragonfly[1-2].*) ;;
-      freebsd* | dragonfly*) use_elf_origin_trick=yes ;;
+      midnightbsd* | freebsd* | dragonfly*) use_elf_origin_trick=yes ;;
       # NetBSD >= 8.0: yes.
       netbsd | netbsd[1-7] | netbsd[1-7].*) ;;
       netbsdelf | netbsdelf[1-7] | netbsdelf[1-7].*) ;;
