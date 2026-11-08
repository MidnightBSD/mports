Backport https://github.com/sphinx-doc/sphinx/commit/b04a2101295ac3fb725b16111eda0284b6da4cca
Adapt exact Pygments 2.21 HTML expectations; retain older-version checks.

--- tests/test_extensions/test_ext_viewcode.py.orig
+++ tests/test_extensions/test_ext_viewcode.py
@@ -19,6 +19,11 @@
         sp = '<span> </span>'
     else:
         sp = ' '
+
+    if tuple(map(int, pygments.__version__.split('.')[:2])) >= (2, 21):
+        ds = '"""this is Class1"""'
+    else:
+        ds = '&quot;&quot;&quot;this is Class1&quot;&quot;&quot;'
 
     warnings = re.sub(r'\\+', '/', app.warning.getvalue())
     assert re.findall(
@@ -49,10 +54,7 @@
     ) in result
     assert '<span>@decorator</span>\n' in result
     assert f'<span>class</span>{sp}<span>Class1</span><span>:</span>\n' in result
-    assert (
-        '<span>    </span>'
-        '<span>&quot;&quot;&quot;this is Class1&quot;&quot;&quot;</span></div>\n'
-    ) in result
+    assert f'<span>    </span><span>{ds}</span></div>\n' in result
 
     return result
 
