--- tests/test_compliance_fixes.py.orig
+++ tests/test_compliance_fixes.py
@@ -1,4 +1,7 @@
-from unittest import TestCase
+from unittest import TestCase, mock
+
+import oauthlib
+from packaging.version import Version
 
 import requests
 import requests_mock
@@ -108,14 +111,15 @@
         mailchimp = OAuth2Session("someclientid", redirect_uri="https://i.b")
         self.session = mailchimp_compliance_fix(mailchimp)
 
-    def test_fetch_access_token(self):
+    @mock.patch("time.time", return_value=1590000000.25)
+    def test_fetch_access_token(self, _clock):
         token = self.session.fetch_token(
             "https://login.mailchimp.com/oauth2/token",
             client_secret="someclientsecret",
             authorization_response="https://i.b/?code=hello",
         )
         # Times should be close
-        approx_expires_at = time.time() + 3600
+        approx_expires_at = (1590000000 if Version(oauthlib.__version__) >= Version("3.3.0") else 1590000000.25) + 3600
         actual_expires_at = token.pop("expires_at")
         self.assertAlmostEqual(actual_expires_at, approx_expires_at, places=2)
 
@@ -283,13 +287,14 @@
         plentymarkets = OAuth2Session("someclientid", redirect_uri="https://i.b")
         self.session = plentymarkets_compliance_fix(plentymarkets)
 
-    def test_fetch_access_token(self):
+    @mock.patch("time.time", return_value=1590000000.75)
+    def test_fetch_access_token(self, _clock):
         token = self.session.fetch_token(
             "https://shop.plentymarkets-cloud02.com",
             authorization_response="https://i.b/?code=hello",
         )
 
-        approx_expires_at = time.time() + 86400
+        approx_expires_at = (1590000001 if Version(oauthlib.__version__) >= Version("3.3.0") else 1590000000.75) + 86400
         actual_expires_at = token.pop("expires_at")
         self.assertAlmostEqual(actual_expires_at, approx_expires_at, places=2)
 
