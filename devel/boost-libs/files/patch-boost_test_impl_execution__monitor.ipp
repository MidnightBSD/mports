--- boost/test/impl/execution_monitor.ipp.orig	2023-07-16 19:41:17 UTC
+++ boost/test/impl/execution_monitor.ipp
@@ -137,25 +137,11 @@ namespace { void _set_se_translator( void* ) {} }
 #  include <signal.h>
 #  include <setjmp.h>
 
-#  if defined(__FreeBSD__)
-
 #    include <osreldate.h>
 
 #    ifndef SIGPOLL
 #      define SIGPOLL SIGIO
 #    endif
-
-#    if (__FreeBSD_version < 70100)
-
-#      define ILL_ILLADR 0 // ILL_RESAD_FAULT
-#      define ILL_PRVOPC ILL_PRIVIN_FAULT
-#      define ILL_ILLOPN 2 // ILL_RESOP_FAULT
-#      define ILL_COPROC ILL_FPOP_FAULT
-
-#      define BOOST_TEST_LIMITED_SIGNAL_DETAILS
-
-#    endif
-#  endif
 
 #  if defined(__ANDROID__)
 #    include <android/api-level.h>
