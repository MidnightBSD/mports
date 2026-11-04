--- src/plugins/platforms/xcb/qxcbatom.cpp.orig	2020-06-29 11:41:01.513276000 -0400
+++ src/plugins/platforms/xcb/qxcbatom.cpp	2020-06-29 11:41:31.338172000 -0400
@@ -44,6 +44,8 @@
 
 #include <algorithm>
 
+#include <cstdlib>
+
 static const char *xcb_atomnames = {
     // window-manager <-> client protocols
     "WM_PROTOCOLS\0"
