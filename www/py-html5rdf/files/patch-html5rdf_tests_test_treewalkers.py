--- html5rdf/tests/test_treewalkers.py.orig
+++ html5rdf/tests/test_treewalkers.py
@@ -201,3 +201,29 @@
                                        ((None, 'b'), '3'),
                                        (('http://www.w3.org/XML/1998/namespace', 'lang'), '4'),
                                        ((None, 'c'), '5')]
+
+
+def test_pprint_mixed_namespace_attributes():
+    html = "http://www.w3.org/1999/xhtml"
+    walker = [
+        {
+            'type': 'StartTag',
+            'namespace': html,
+            'name': 'root',
+            'data': {
+                (None, 'plain'): '0',
+                ('', 'empty'): '1',
+                ('urn:z', 'last'): '3',
+                ('urn:a', 'first'): '2',
+            },
+        },
+        {'type': 'EndTag', 'namespace': html, 'name': 'root'},
+    ]
+
+    assert treewalkers.pprint(walker) == (
+        '<root>\n'
+        '  plain="0"\n'
+        '  empty="1"\n'
+        '  urn:a first="2"\n'
+        '  urn:z last="3"'
+    )
