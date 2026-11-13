--- tests/test_to_thread.py.orig	2026-09-05 10:42:00 UTC
+++ tests/test_to_thread.py
@@ -416,13 +416,12 @@
             with provider as portal:
                 portal.call(check_thread)
 
-        with ThreadPoolExecutor(max_workers=3) as pool:
+        with provider as portal, ThreadPoolExecutor(max_workers=3) as pool:
             for _ in range(3):
                 pool.submit(dummy)
 
-            with provider as portal:
-                portal.call(wait_all_tasks_blocked)
-                portal.call(event.set)
+            portal.call(wait_all_tasks_blocked)
+            portal.call(event.set)
 
         assert len(threads) == 1
 
