--- toolkit/xre/nsXREDirProvider.cpp.orig	2026-08-19 12:19:50 UTC
+++ toolkit/xre/nsXREDirProvider.cpp
@@ -61,6 +61,9 @@
 #  ifdef XP_MACOSX
 #    include "MacApplicationDelegate.h"
 #  endif
+#  ifdef Success // from X.h, this really messes up nss
+#    undef Success
+#  endif
 #  include "ScopedNSSTypes.h"
 #  include "nsNSSComponent.h"
 #endif
