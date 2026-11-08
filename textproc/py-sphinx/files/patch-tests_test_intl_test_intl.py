Backport https://github.com/sphinx-doc/sphinx/commit/b04a2101295ac3fb725b16111eda0284b6da4cca
Adapt exact Pygments 2.21 HTML expectations; retain older-version checks.

--- tests/test_intl/test_intl.py.orig
+++ tests/test_intl/test_intl.py
@@ -1550,6 +1550,11 @@
     else:
         sp = ' '
 
+    if tuple(map(int, pygments.__version__.split('.')[:2])) >= (2, 21):
+        res = "'result'"
+    else:
+        res = '&#39;result&#39;'
+
     app.build()
     # [literalblock.txt]
     result = (app.outdir / 'literalblock.html').read_text(encoding='utf8')
@@ -1559,7 +1564,7 @@
     assert_count(expected_expr, result, 2)
 
     # ruby code block should not be translated but be highlighted
-    expected_expr = """<span class="s1">&#39;result&#39;</span>"""
+    expected_expr = f"""<span class="s1">{res}</span>"""
     assert_count(expected_expr, result, 1)
 
     # C code block without lang should not be translated and *ruby* highlighted
@@ -1638,6 +1643,13 @@
     else:
         sp = ' '
 
+    if tuple(map(int, pygments.__version__.split('.')[:2])) >= (2, 21):
+        home = '"HTTPS://SPHINX-DOC.ORG"'
+        res = "'RESULT'"
+    else:
+        home = '&quot;HTTPS://SPHINX-DOC.ORG&quot;'
+        res = '&#39;RESULT&#39;'
+
     app.build()
     # [literalblock.txt]
     result = (app.outdir / 'literalblock.html').read_text(encoding='utf8')
@@ -1650,7 +1662,7 @@
     assert_count(expected_expr, result, 1)
 
     # literalinclude should be translated
-    expected_expr = '<span class="s2">&quot;HTTPS://SPHINX-DOC.ORG&quot;</span>'
+    expected_expr = f'<span class="s2">{home}</span>'
     assert_count(expected_expr, result, 1)
 
     # title should be translated
@@ -1658,7 +1670,7 @@
     assert_count(expected_expr, result, 2)
 
     # ruby code block should be translated and be highlighted
-    expected_expr = """<span class="s1">&#39;RESULT&#39;</span>"""
+    expected_expr = f"""<span class="s1">{res}</span>"""
     assert_count(expected_expr, result, 1)
 
     # C code block without lang should be translated and *ruby* highlighted
