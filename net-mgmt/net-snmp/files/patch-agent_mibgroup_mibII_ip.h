--- agent/mibgroup/mibII/ip.h.orig	2021-05-25 15:19:35 UTC
+++ agent/mibgroup/mibII/ip.h
@@ -23,6 +23,10 @@ config_require(mibII/kernel_linux);
 config_require(mibII/kernel_netbsd);
 #endif

+#if defined( freebsd4 ) || defined( netbsd5 ) || defined( openbsd4 ) || defined( dragonfly ) || defined( darwin ) || defined( midnightbsd )
+config_require(ip-mib/data_access/scalars_sysctl);
+#endif
+
 #include "var_route.h"
 #include "route_write.h"
