--- eventlet/green/select.py.orig
+++ eventlet/green/select.py
@@ -18,12 +18,14 @@
     except AttributeError:
         if not isinstance(obj, int):
             raise TypeError("Expected int or long, got %s" % type(obj))
-        return obj
+        rv = obj
     else:
         rv = f()
         if not isinstance(rv, int):
             raise TypeError("Expected int or long, got %s" % type(rv))
-        return rv
+    if rv < 0:
+        raise ValueError("file descriptor cannot be a negative integer (%d)" % rv)
+    return rv
 
 
 def select(read_list, write_list, error_list, timeout=None):
