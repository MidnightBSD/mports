--- src/hypothesis/strategies/_internal/datetime.py.orig
+++ src/hypothesis/strategies/_internal/datetime.py
@@ -1142,6 +1142,11 @@
 @cache
 def _valid_key_cacheable(tzpath, key):
     assert isinstance(tzpath, tuple)  # zoneinfo changed, better update this function!
+    # Some zoneinfo databases list files which ZoneInfo cannot parse.
+    try:
+        zoneinfo.ZoneInfo.no_cache(key)
+    except (ValueError, zoneinfo.ZoneInfoNotFoundError):
+        return False
     for root in tzpath:
         if Path(root).joinpath(key).exists():  # pragma: no branch
             # No branch because most systems only have one TZPATH component.
