--- src/loader/loader_wayland_helper.c.orig	2024-11-27 00:00:00 UTC
+++ src/loader/loader_wayland_helper.c
@@ -22,8 +22,10 @@
 
 #include <poll.h>
 #include <errno.h>
+#include <time.h>
 
 #include "util/perf/cpu_trace.h"
+#include "util/timespec.h"
 
 #include "loader_wayland_helper.h"
 
