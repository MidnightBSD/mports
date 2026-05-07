--- agent/mibgroup/mibII/icmp.h.orig
+++ agent/mibgroup/mibII/icmp.h
@@ -10,7 +10,7 @@ config_require(kernel_sunos5)
 #elif defined(linux)
 config_require(mibII/kernel_linux)
 #elif defined(freebsd4) || defined(openbsd4) || defined(dragonfly2) || \
-    defined(darwin10)
+    defined(darwin10) || defined(midnightbsd)
 config_require(mibII/kernel_sysctl)
 #elif defined(netbsd) || defined(netbsdelf)
 config_require(mibII/kernel_netbsd)
