--- config/hwloc.m4
+++ config/hwloc.m4
@@ -265,7 +265,7 @@
         AC_MSG_RESULT([Windows])
         hwloc_components="$hwloc_components windows"
         ;;
-      *-*-*freebsd*)
+      *-*-*freebsd*|*-*-*midnightbsd*)
         AC_DEFINE(HWLOC_FREEBSD_SYS, 1, [Define to 1 on *FREEBSD])
         hwloc_freebsd=yes
         AC_MSG_RESULT([FreeBSD])
