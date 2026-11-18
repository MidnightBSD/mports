--- langchain_core/utils/uuid.py.orig
+++ langchain_core/utils/uuid.py
@@ -7,6 +7,7 @@
 from __future__ import annotations
 
 import typing
+from inspect import signature
 from uuid import UUID
 
 from uuid_utils.compat import uuid7 as _uuid_utils_uuid7
@@ -15,6 +16,9 @@
     from uuid import UUID
 
 _NANOS_PER_SECOND: typing.Final = 1_000_000_000
+_UUID_UTILS_HAS_NANOSECONDS: typing.Final = (
+    "nanoseconds" in signature(_uuid_utils_uuid7).parameters
+)
 
 
 def _to_timestamp_and_nanos(nanoseconds: int) -> tuple[int, int]:
@@ -50,6 +54,8 @@
     # For now, just delegate to the uuid_utils implementation
     if nanoseconds is None:
         return _uuid_utils_uuid7()
+    if _UUID_UTILS_HAS_NANOSECONDS:
+        return _uuid_utils_uuid7(nanoseconds=nanoseconds)
     seconds, nanos = _to_timestamp_and_nanos(nanoseconds)
     return _uuid_utils_uuid7(timestamp=seconds, nanos=nanos)
