--- src/langsmith/_internal/_uuid.py.orig
+++ src/langsmith/_internal/_uuid.py
@@ -2,6 +2,7 @@

 from __future__ import annotations

+import inspect
 import uuid
 import warnings
 from typing import Final
@@ -10,6 +11,7 @@
 from uuid_utils.compat import uuid7 as _uuid_utils_uuid7

 _NANOS_PER_SECOND: Final = 1_000_000_000
+_UUID7_SUPPORTS_NANOSECONDS: Final = "nanoseconds" in inspect.signature(_uuid_utils_uuid7).parameters


 def _to_timestamp_and_nanos(nanoseconds: int) -> tuple[int, int]:
@@ -42,5 +44,7 @@
     # For now, just delegate to the uuid_utils implementation
     if nanoseconds is None:
         return _uuid_utils_uuid7()
+    if _UUID7_SUPPORTS_NANOSECONDS:
+        return _uuid_utils_uuid7(nanoseconds=nanoseconds)
     seconds, nanos = _to_timestamp_and_nanos(nanoseconds)
     return _uuid_utils_uuid7(timestamp=seconds, nanos=nanos)
