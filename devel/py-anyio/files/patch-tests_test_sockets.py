--- tests/test_sockets.py.orig	2026-09-05 10:42:00 UTC
+++ tests/test_sockets.py
@@ -699,6 +699,9 @@ class TestTCPStream:
         def serve() -> None:
             sock, _addr = server_sock.accept()
             event.wait(3)
+            if sys.platform.startswith("midnightbsd"):
+                # Force the reset this test expects when the server crashes.
+                sock.setsockopt(socket.SOL_SOCKET, socket.SO_LINGER, struct.pack("ii", 1, 0))
             sock.close()
             del sock
             gc.collect()
