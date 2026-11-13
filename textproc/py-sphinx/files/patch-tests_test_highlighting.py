Backport https://github.com/sphinx-doc/sphinx/commit/b04a2101295ac3fb725b16111eda0284b6da4cca
Adapt exact Pygments 2.21 HTML expectations; retain older-version checks.

--- tests/test_highlighting.py.orig
+++ tests/test_highlighting.py
@@ -25,6 +25,11 @@
     from pygments.formatter import Formatter
 
     Formatter.__class_getitem__ = classmethod(lambda cls, name: cls)  # type: ignore[attr-defined]
+
+if tuple(map(int, pygments.__version__.split('.')[:2])) < (2, 21):
+    hsw = '&quot;Hello sphinx world&quot;'
+else:
+    hsw = '"Hello sphinx world"'
 
 
 class MyLexer(RegexLexer):
@@ -93,7 +98,7 @@
     ret = bridge.highlight_block('print "Hello sphinx world"', 'default')
     assert ret == (
         '<div class="highlight"><pre><span></span><span class="nb">print</span> '
-        '<span class="s2">&quot;Hello sphinx world&quot;</span>\n</pre></div>\n'
+        f'<span class="s2">{hsw}</span>\n</pre></div>\n'
     )
 
     # default: fallbacks to none if highlighting failed
@@ -107,7 +112,7 @@
     assert ret == (
         '<div class="highlight"><pre><span></span><span class="nb">print</span>'
         '<span class="p">(</span>'
-        '<span class="s2">&quot;Hello sphinx world&quot;</span>'
+        f'<span class="s2">{hsw}</span>'
         '<span class="p">)</span>\n</pre></div>\n'
     )
 
@@ -116,7 +121,7 @@
     assert ret == (
         '<div class="highlight"><pre><span></span><span class="nb">print</span>'
         '<span class="p">(</span>'
-        '<span class="s2">&quot;Hello sphinx world&quot;</span>'
+        f'<span class="s2">{hsw}</span>'
         '<span class="p">)</span>\n</pre></div>\n'
     )
 
