--- netwerk/wifi/freebsd/FreeBsdWifiScanner.cpp.orig	2025-01-01 00:00:00.000000000 +0000
+++ netwerk/wifi/freebsd/FreeBsdWifiScanner.cpp
@@ -18,5 +18,14 @@
 #else
-#  include <net80211/ieee80211_ioctl.h>
+/* On MidnightBSD, ieee80211req and ieee80211req_scan_result are guarded by
+ * #ifdef __MidnightBSD__ in <net80211/ieee80211_ioctl.h>.  When the build
+ * uses a FreeBSD target triple the compiler does not define __MidnightBSD__,
+ * so we define it temporarily to make those types visible. */
+#  ifndef __MidnightBSD__
+#    define __MidnightBSD__ 1
+#    include <net80211/ieee80211_ioctl.h>
+#    undef __MidnightBSD__
+#  else
+#    include <net80211/ieee80211_ioctl.h>
+#  endif
 #endif
