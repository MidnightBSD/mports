--- tests/test_blocking_network.py.orig	2020-02-02 00:00:00 UTC
+++ tests/test_blocking_network.py
@@ -12,9 +12,13 @@
 
 # Windows doesn’t have AF_NETLINK & AF_UNIX
 try:
-    from socket import AF_NETLINK, AF_UNIX
+    from socket import AF_NETLINK
 except ImportError:
     AF_NETLINK = None  # type: ignore[assignment]
+
+try:
+    from socket import AF_UNIX
+except ImportError:
     AF_UNIX = None  # type: ignore[assignment]
 
 
