--- src/enrich/console.py.orig	2024-06-14 12:49:49 UTC
+++ src/enrich/console.py
@@ -38,6 +38,16 @@
                 sys.stdout = FileProxy(self, sys.stdout)  # type: ignore
             if not hasattr(sys.stderr, "rich_proxied_file"):
                 sys.stderr = FileProxy(self, sys.stderr)  # type: ignore
+
+    def _check_buffer(self) -> None:
+        """Record and flush only completed console buffers.
+
+        Older Rich releases record nested buffers more than once. Quiet
+        consoles still delegate immediately so discarded output stays quiet.
+        """
+        if self._buffer_index and not getattr(self, "quiet", False):
+            return
+        super()._check_buffer()
 
     # https://github.com/python/mypy/issues/4441
     def print(self, *args, **kwargs) -> None:  # type: ignore
