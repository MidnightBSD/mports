--- src/furo/sphinxext.py.orig
+++ src/furo/sphinxext.py
@@ -85,7 +85,7 @@
         self.assert_has_content()
 
         container = nodes.container()
-        transated_content = _translate_into_tab_demo(self.block_text)
+        transated_content = _translate_into_tab_demo("\n".join(self.content))
         self.state.nested_parse(transated_content, 0, container)
         return [container]
 
