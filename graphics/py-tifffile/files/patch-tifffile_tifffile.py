--- tifffile/tifffile.py.orig
+++ tifffile/tifffile.py
@@ -13499,7 +13499,15 @@
         # writing non-contiguous arrays is very slow
         data = numpy.ascontiguousarray(data, dtype)
         try:
-            data.tofile(self._fh)
+            if sys.platform.startswith('midnightbsd') and data.nbytes > 2**31 - 1:
+                # libc fwrite uses a signed 32-bit residual byte count.
+                # Bound each write to avoid silent truncation beyond 4 GiB.
+                flat = data.reshape(-1)
+                count = (2**31 - 1) // data.dtype.itemsize
+                for start in range(0, flat.size, count):
+                    flat[start : start + count].tofile(self._fh)
+            else:
+                data.tofile(self._fh)
         except io.UnsupportedOperation:
             # numpy cannot write to BytesIO
             self._fh.write(data.tobytes())
