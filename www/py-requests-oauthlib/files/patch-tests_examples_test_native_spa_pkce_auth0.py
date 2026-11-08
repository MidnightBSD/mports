--- tests/examples/test_native_spa_pkce_auth0.py.orig
+++ tests/examples/test_native_spa_pkce_auth0.py
@@ -1,5 +1,10 @@
 import os
 import unittest
+
+if not all(os.environ.get(name) for name in (
+    "AUTH0_USERNAME", "AUTH0_PASSWORD", "AUTH0_PKCE_CLIENT_ID", "AUTH0_DOMAIN"
+)):
+    raise unittest.SkipTest("Auth0 browser integration is not configured")
 
 from . import base
 
