Backport https://github.com/sphinx-doc/sphinx/commit/b04a2101295ac3fb725b16111eda0284b6da4cca
Adapt exact Pygments 2.21 HTML expectations; retain older-version checks.

--- tests/test_builders/test_build_html_code.py.orig
+++ tests/test_builders/test_build_html_code.py
@@ -45,6 +45,11 @@
     else:
         sp = ' '
 
+    if tuple(map(int, pygments.__version__.split('.')[:2])) >= (2, 21):
+        abc = '"abc"'
+    else:
+        abc = '&quot;abc&quot;'
+
     app.build()
     content = (app.outdir / 'index.html').read_text(encoding='utf8')
 
@@ -57,7 +62,7 @@
         '<span class="o">+</span> '
         '<span class="kc">None</span> '
         '<span class="o">+</span> '
-        '<span class="s2">&quot;abc&quot;</span>'
+        f'<span class="s2">{abc}</span>'
         '<span class="p">):</span> '
         '<span class="k">pass</span>'
     )
