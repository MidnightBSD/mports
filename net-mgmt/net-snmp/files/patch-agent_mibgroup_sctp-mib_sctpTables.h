--- agent/mibgroup/sctp-mib/sctpTables.h.orig
+++ agent/mibgroup/sctp-mib/sctpTables.h
@@ -15,7 +15,7 @@
 #if defined( linux )
 config_require(sctp-mib/sctpTables_linux);
 config_require(util_funcs/get_pid_from_inode);
-#elif defined( freebsd7 ) || defined( freebsd8 )
+#elif defined( freebsd7 ) || defined( freebsd8 ) || defined( midnightbsd )
 config_require(sctp-mib/sctpTables_freebsd);
 #elif defined( solaris2 )
 config_require(sctp-mib/sctpTables_solaris2);
