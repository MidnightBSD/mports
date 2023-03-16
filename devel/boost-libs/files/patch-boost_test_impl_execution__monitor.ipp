--- boost/test/impl/execution_monitor.ipp.orig	2023-03-16 13:52:49 UTC
+++ boost/test/impl/execution_monitor.ipp
@@ -137,7 +137,7 @@ namespace { void _set_se_translator( voi
 #  include <signal.h>
 #  include <setjmp.h>
 
-#  if defined(__FreeBSD__)
+#  if defined(__FreeBSD__) || defined(__MidnightBSD__)
 
 #    include <osreldate.h>
 
@@ -145,7 +145,7 @@ namespace { void _set_se_translator( voi
 #      define SIGPOLL SIGIO
 #    endif
 
-#    if (__FreeBSD_version < 70100)
+#    if (__FreeBSD_version < 70100 || __MidnightBSD_version < 10000)
 
 #      define ILL_ILLADR 0 // ILL_RESAD_FAULT
 #      define ILL_PRVOPC ILL_PRIVIN_FAULT
