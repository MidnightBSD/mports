--- agent/mibgroup/mibII/icmp.h.orig
+++ agent/mibgroup/mibII/icmp.h
@@ -10,7 +10,7 @@
 #elif defined(linux)
 config_require(mibII/kernel_linux);
 #elif defined(freebsd4) || defined(openbsd4) || defined(dragonfly2) || \
-    defined(darwin)
+    defined(darwin) || defined(midnightbsd)
 config_require(mibII/kernel_sysctl);
 #elif defined(netbsd5) || defined(netbsdelf5)
 config_require(mibII/kernel_netbsd);
