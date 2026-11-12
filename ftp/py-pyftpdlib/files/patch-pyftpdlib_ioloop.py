--- pyftpdlib/ioloop.py.orig
+++ pyftpdlib/ioloop.py
@@ -682,9 +682,20 @@
             _IOLoop.__init__(self)
             self._kqueue = select.kqueue()
             self._active = {}
+            self._pid = os.getpid()
+
+        def _reopen_after_fork(self):
+            # kqueue objects are closed in forked children by Python.
+            if self._pid != os.getpid():
+                self._kqueue.close()
+                self._kqueue = select.kqueue()
+                self._pid = os.getpid()
+                for fd, events in self._active.items():
+                    self._control(fd, events, select.KQ_EV_ADD)
 
         def fileno(self):
             """Return kqueue() fd."""
+            self._reopen_after_fork()
             return self._kqueue.fileno()
 
         def close(self):
@@ -729,6 +740,7 @@
             self.register(fd, instance, events)
 
         def _control(self, fd, events, flags):
+            self._reopen_after_fork()
             kevents = []
             if events & self.WRITE:
                 kevents.append(
@@ -759,6 +771,7 @@
             _EOF=select.KQ_EV_EOF,
             _ERROR=select.KQ_EV_ERROR,
         ):
+            self._reopen_after_fork()
             try:
                 kevents = self._kqueue.control(
                     None, _len(self.socket_map), timeout
