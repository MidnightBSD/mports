--- src/trio/_tests/test_fakenet.py.orig
+++ src/trio/_tests/test_fakenet.py
@@ -11,7 +11,7 @@
 # ENOTCONN gives different messages on different platforms
 if sys.platform == "linux":
     ENOTCONN_MSG = r"^\[Errno 107\] (Transport endpoint is|Socket) not connected$"
-elif sys.platform == "darwin":
+elif sys.platform == "darwin" or sys.platform.startswith(("freebsd", "midnightbsd")):
     ENOTCONN_MSG = r"^\[Errno 57\] Socket is not connected$"
 else:
     ENOTCONN_MSG = r"^\[Errno 10057\] Unknown error$"
