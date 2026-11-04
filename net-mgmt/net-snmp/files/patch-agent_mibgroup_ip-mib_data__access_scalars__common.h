--- agent/mibgroup/ip-mib/data_access/scalars_common.h.orig	2021-05-25 15:19:35 UTC
+++ agent/mibgroup/ip-mib/data_access/scalars_common.h
@@ -19,7 +19,7 @@
  */
 #if defined( linux )
 config_require(ip-mib/data_access/scalars_linux);
-#elif defined( freebsd4 ) || defined( netbsd5 ) || defined( openbsd4 ) || defined( dragonfly ) || defined( darwin )
+#elif defined( freebsd4 ) || defined( netbsd5 ) || defined( openbsd4 ) || defined( dragonfly ) || defined( darwin ) || defined( midnightbsd )
 config_require(ip-mib/data_access/scalars_sysctl);
 #else
 /*
