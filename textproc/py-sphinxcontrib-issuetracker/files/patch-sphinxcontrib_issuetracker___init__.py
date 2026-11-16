--- sphinxcontrib/issuetracker/__init__.py.orig
+++ sphinxcontrib/issuetracker/__init__.py
@@ -55,0 +56,3 @@
+from sphinx.util import logging
+
+logger = logging.getLogger(__name__)
@@ -288 +291 @@
-    app.add_stylesheet('issuetracker.css')
+    app.add_css_file('issuetracker.css')
@@ -304 +307 @@
-    app.info(bold('Copying issuetracker stylesheet... '), nonl=True)
+    logger.info(bold('Copying issuetracker stylesheet... '))
@@ -309 +312 @@
-    app.info('done')
+    logger.info('done')
