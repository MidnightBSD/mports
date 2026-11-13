--- fakeredis/stack/_tdigest_mixin.py.orig
+++ fakeredis/stack/_tdigest_mixin.py
@@ -153,12 +153,13 @@
     def tdigest_quantile(self, key: CommandItem, *quantiles: float) -> list[float]:
         if key.value is None:
             raise SimpleError(msgs.TDIGEST_KEY_NOT_EXISTS)
-        if len(key.value) <= 1:
-            return [float("nan")]
         res: list[float] = []
         for q in quantiles:
             if q < 0 or q > 1:
                 raise SimpleError(msgs.TDIGEST_BAD_QUANTILE)
+            if len(key.value) == 0:
+                res.append(float("nan"))
+                continue
             ind = int(q * len(key.value))
             if ind == len(key.value):
                 ind -= 1
