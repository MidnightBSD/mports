--- material/plugins/social/plugin.py.orig
+++ material/plugins/social/plugin.py
@@ -110,6 +110,7 @@
         # Initialize thread pool for card layers
         self.card_layer_pool = ThreadPoolExecutor(self.config.concurrency)
         self.card_layer_pool_jobs: dict[str, Future] = {}
+        self.card_layer_pool_jobs_lock = Lock()
 
     # Resolve and load manifest and initialize environment
     def on_config(self, config):
@@ -422,16 +423,13 @@
         # Spawn concurrent jobs to render layers - we only need to render layers
         # that we haven't already dispatched, reducing work by deduplication
         for h, layer in layers.items():
-            sentinel = Future()
-
-            # We need to use a hack here to avoid locking the thread pool while
-            # we check if the layer was already dispatched. If we don't do this,
-            # layers might be dispatched multiple times. The trick is to use a
-            # sentinel value to check if the layer was already dispatched.
-            if sentinel == self.card_layer_pool_jobs.setdefault(h, sentinel):
-                self.card_layer_pool_jobs[h] = self.card_layer_pool.submit(
-                    self._render, layer, page, config
-                )
+            # Check and publish a submitted future atomically so concurrent
+            # cards cannot observe an unresolved sentinel future.
+            with self.card_layer_pool_jobs_lock:
+                if h not in self.card_layer_pool_jobs:
+                    self.card_layer_pool_jobs[h] = self.card_layer_pool.submit(
+                        self._render, layer, page, config
+                    )
 
         # Reconcile concurrent jobs to render layers and compose card - since
         # layers are rendered in parallel, we can compose the card as soon as
