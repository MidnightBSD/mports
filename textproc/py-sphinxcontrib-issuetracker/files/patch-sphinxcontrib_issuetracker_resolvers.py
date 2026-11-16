--- sphinxcontrib/issuetracker/resolvers.py.orig
+++ sphinxcontrib/issuetracker/resolvers.py
@@ -44,0 +45,3 @@
+from sphinx.util import logging
+
+logger = logging.getLogger(__name__)
@@ -92 +95 @@
-        app.warn(msg.format(response))
+        logger.warning(msg.format(response))
@@ -111 +114 @@
-                app.warn('Github rate limit hit')
+                logger.warning('Github rate limit hit')
@@ -118 +121 @@
-        app.warn('Github rate limit exceeded, not resolving issue {0}'.format(
+        logger.warning('Github rate limit exceeded, not resolving issue {0}'.format(
