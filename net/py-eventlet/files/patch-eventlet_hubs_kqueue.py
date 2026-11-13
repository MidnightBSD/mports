--- eventlet/hubs/kqueue.py.orig
+++ eventlet/hubs/kqueue.py
@@ -51,8 +51,10 @@
                 event = select.kevent(fileno, self.FILTERS.get(evtype), select.KQ_EV_ADD)
                 self._control([event], 0, 0)
                 events[evtype] = event
-            except ValueError:
+            except BaseException:
                 super().remove(listener)
+                if not events:
+                    self._events.pop(fileno, None)
                 raise
         return listener
 
