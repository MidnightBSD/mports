--- numexpr/cpuinfo.py.orig	2026-07-18 10:31:18 UTC
+++ numexpr/cpuinfo.py
@@ -85,6 +85,9 @@
     """Holds CPU information and provides methods for requiring
     the availability of various CPU features.
     """
+
+    # Keep CPU metadata indexable on unsupported platforms.
+    info = [{}]
 
     def _try_call(self, func):
         try:
