--- include/sm/os/sm_os_freebsd.h.orig	2021-06-09 04:27:53.000000000 -0400
+++ include/sm/os/sm_os_freebsd.h	2023-03-07 17:58:40.315631000 -0500
@@ -26,7 +26,7 @@
 #       define SM_CONF_STRL		1
 #    endif
 #  endif
-#  if __FreeBSD_version >= 1200059
+#  if __FreeBSD_version >= 1200059 || __MidnightBSD_version > 300000
 #   ifndef SM_CONF_SEM
 #    define SM_CONF_SEM	2 /* union semun is no longer declared by default */
 #   endif
