Obtained from: https://github.com/sphinx-doc/sphinxcontrib-websupport/pull/91

--- sphinxcontrib/websupport/builder.py.orig
+++ sphinxcontrib/websupport/builder.py
@@ -12 +11,0 @@
-from docutils.io import StringOutput
@@ -83 +81,0 @@
-        destination = StringOutput(encoding='utf-8')
@@ -91,4 +89,4 @@
-        self.docwriter.write(doctree, destination)
-        self.docwriter.assemble_parts()
-        body = self.docwriter.parts['fragment']
-        metatags = self.docwriter.clean_meta
+        visitor = self.create_translator(doctree, self)
+        doctree.walkabout(visitor)
+        body = ''.join(visitor.fragment)
+        clean_meta = ''.join(visitor.meta[2:])
@@ -96 +94 @@
-        ctx = self.get_doc_context(docname, body, metatags)
+        ctx = self.get_doc_context(docname, body, clean_meta)
