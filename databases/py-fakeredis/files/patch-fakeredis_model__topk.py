--- fakeredis/model/_topk.py.orig
+++ fakeredis/model/_topk.py
@@ -5,6 +5,29 @@
 import time
 
 from ._base_type import BaseModel
+
+
+def _murmurhash2(data: bytes, seed: int) -> int:
+    # MurmurHash2 by Austin Appleby is in the public domain. RedisBloom uses
+    # native little-endian words on the supported x86 architectures.
+    mask = 0xFFFFFFFF
+    multiplier = 0x5BD1E995
+    value = (seed ^ len(data)) & mask
+    offset = 0
+    while offset + 4 <= len(data):
+        chunk = int.from_bytes(data[offset : offset + 4], "little")
+        chunk = (chunk * multiplier) & mask
+        chunk ^= chunk >> 24
+        chunk = (chunk * multiplier) & mask
+        value = ((value * multiplier) & mask) ^ chunk
+        offset += 4
+    tail = data[offset:]
+    if tail:
+        value ^= int.from_bytes(tail, "little")
+        value = (value * multiplier) & mask
+    value ^= value >> 13
+    value = (value * multiplier) & mask
+    return value ^ (value >> 15)
 
 
 class Bucket:
@@ -37,24 +60,24 @@
 
 
 class HashArray:
-    def __init__(self, width: int, decay: float):
+    def __init__(self, width: int, decay: float, seed: int):
         self.width = width
         self.decay = decay
         self.array = [Bucket(0, 0) for _ in range(width)]
-        self._seed = random.getrandbits(32)
+        self._seed = seed
 
     def count(self, item: bytes) -> int:
-        return self.get_bucket(item).count(self._hash(item))
+        return self.get_bucket(item).count(_murmurhash2(item, 1919))
 
     def add(self, item: bytes, incr: int) -> int:
         bucket = self.get_bucket(item)
-        return bucket.add(self._hash(item), incr, self.decay)
+        return bucket.add(_murmurhash2(item, 1919), incr, self.decay)
 
     def get_bucket(self, item: bytes) -> Bucket:
         return self.array[self._hash(item) % self.width]
 
     def _hash(self, item: bytes) -> int:
-        return hash(item) ^ self._seed
+        return _murmurhash2(item, self._seed)
 
 
 class HeavyKeeper(BaseModel):
@@ -68,7 +91,7 @@
         self.width = width
         self.depth = depth
         self.decay = decay
-        self.hash_arrays = [HashArray(width, decay) for _ in range(depth)]
+        self.hash_arrays = [HashArray(width, decay, seed) for seed in range(depth)]
         self.min_heap: list[tuple[int, bytes]] = []
 
     def _index(self, val: bytes) -> int:
