--- agent/mibgroup/sctp-mib/sctpScalars.h.orig
+++ agent/mibgroup/sctp-mib/sctpScalars.h
@@ -7,7 +7,7 @@
 config_require(sctp-mib/sctpScalars_common);
 #if defined( linux )
 config_require(sctp-mib/sctpScalars_linux);
-#elif defined( freebsd8 ) || defined ( freebsd7 )
+#elif defined( freebsd8 ) || defined ( freebsd7 ) || defined( midnightbsd )
 config_require(sctp-mib/sctpScalars_freebsd);
 #elif defined( solaris2 )
 config_require(sctp-mib/sctpScalars_solaris2);
