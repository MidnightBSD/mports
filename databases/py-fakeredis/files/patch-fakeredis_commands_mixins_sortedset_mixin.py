--- fakeredis/commands_mixins/sortedset_mixin.py.orig
+++ fakeredis/commands_mixins/sortedset_mixin.py
@@ -26,6 +26,32 @@
 from fakeredis._helpers import SimpleError, casematch, null_terminate
 from fakeredis.commands_mixins._mixin_base import CommandsMixinBase
 from fakeredis.model import ExpiringMembersSet, ZSet
+
+def _sort_zset_sources(sources: list[tuple[ZSet, float]]) -> list[tuple[ZSet, float]]:
+    if not sys.platform.startswith(("freebsd", "midnightbsd")):
+        return sorted(sources, key=lambda source: len(source[0]))
+
+    # Redis uses libc qsort, whose order for equally sized sets is unstable
+    # on BSD. That order matters for floating-point aggregation (including
+    # NaN from zero times infinity), so use the same local libc ordering.
+    import ctypes
+
+    lengths = tuple(len(source[0]) for source in sources)
+    index_type = ctypes.c_size_t
+    order = (index_type * len(sources))(*range(len(sources)))
+    compare_type = ctypes.CFUNCTYPE(ctypes.c_int, ctypes.POINTER(index_type), ctypes.POINTER(index_type))
+
+    @compare_type
+    def compare(left, right):
+        a, b = lengths[left[0]], lengths[right[0]]
+        return (a > b) - (a < b)
+
+    qsort = ctypes.CDLL(None).qsort
+    qsort.argtypes = (ctypes.c_void_p, ctypes.c_size_t, ctypes.c_size_t, compare_type)
+    qsort.restype = None
+    qsort(order, len(sources), ctypes.sizeof(index_type), compare)
+    return [sources[index] for index in order]
+
 
 SORTED_SET_METHODS = {
     "ZUNIONSTORE": lambda s1, s2: s1 | s2,
@@ -518,7 +544,7 @@
         out: dict[bytes, Any] = {}
         # The sort affects the order of floating-point operations. Note that redis uses qsort(1), which has no stability
         # guarantees, so we can't be sure to match it in all cases.
-        for s, w in sorted(zip(sets, weights), key=lambda x: len(x[0])):
+        for s, w in _sort_zset_sources(list(zip(sets, weights))):
             for member, score in s.items():
                 # With COUNT, each set contributes its weight regardless of the member's score.
                 score = w if aggregate == b"count" else score * w
