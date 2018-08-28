--- ./content/public/test/browser_test_base.cc.orig	2014-08-12 21:01:19.000000000 +0200
+++ ./content/public/test/browser_test_base.cc	2014-08-13 09:56:57.000000000 +0200
@@ -4,6 +4,10 @@
 
 #include "content/public/test/browser_test_base.h"
 
+#if defined(OS_FREEBSD)
+#include <sys/signal.h>
+#endif
+
 #include "base/bind.h"
 #include "base/command_line.h"
 #include "base/debug/stack_trace.h"
