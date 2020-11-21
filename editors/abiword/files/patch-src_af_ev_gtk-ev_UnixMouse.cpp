--- src/af/ev/gtk/ev_UnixMouse.cpp.orig	2020-01-27 14:54:30 UTC
+++ src/af/ev/gtk/ev_UnixMouse.cpp
@@ -20,6 +20,7 @@
 // TODO see if we need to do the GTK absolute-to-relative coordinate
 // TODO trick like we did in the top ruler.

+#include <math.h>
 #include "ut_assert.h"
 #include "ut_debugmsg.h"
 #include "ut_types.h"
