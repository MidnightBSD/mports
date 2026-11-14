--- src/python/compreffor/pyCompressor.py.orig
+++ src/python/compreffor/pyCompressor.py
@@ -271,7 +271,9 @@
         next_key = 0

         for k in self.glyph_set_keys:
-            char_string = glyph_set[k]._glyph
+            char_string = glyph_set[k]
+            if not hasattr(char_string, "decompile"):
+                char_string = char_string._glyph
             char_string.decompile()
             program = []
             piter = iter(enumerate(char_string.program))
@@ -483,7 +485,7 @@
             n_locals = len(top_dict.FDArray)
             fdsel = lambda g: top_dict.CharStrings.getItemAndSelector(g)[1]

-        ans = self.iterative_encode(self.font.getGlyphSet(),
+        ans = self.iterative_encode(top_dict.CharStrings,
                                     fdsel,
                                     n_locals)
