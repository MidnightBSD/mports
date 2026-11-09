--- src/trio/_unix_pipes.py.orig
+++ src/trio/_unix_pipes.py
@@ -156,7 +156,11 @@
         with self._send_conflict_detector:
             if self._fd_holder.closed:
                 raise trio.ClosedResourceError("file was already closed")
-            await trio.lowlevel.wait_writable(self._fd_holder.fd)
+            try:
+                await trio.lowlevel.wait_writable(self._fd_holder.fd)
+            except BrokenPipeError as e:
+                # kqueue can report EPIPE while registering the write event.
+                raise trio.BrokenResourceError from e
 
     async def receive_some(self, max_bytes: int | None = None) -> bytes:
         with self._receive_conflict_detector:
