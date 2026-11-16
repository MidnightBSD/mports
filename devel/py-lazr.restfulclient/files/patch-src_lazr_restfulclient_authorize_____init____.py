--- src/lazr/restfulclient/authorize/__init__.py.orig	2021-11-17 10:38:41 UTC
+++ src/lazr/restfulclient/authorize/__init__.py
@@ -88,12 +88,10 @@ class BasicHttpAuthorizer(HttpAuthorizer):

         This sets the authorization header with the username/password.
         """
-        headers["authorization"] = (
-            "Basic "
-            + base64.b64encode(
-                "%s:%s" % (self.username, self.password)
-            ).strip()
-        )
+        credentials = base64.b64encode(
+            ("%s:%s" % (self.username, self.password)).encode()
+        ).decode("ascii")
+        headers["authorization"] = "Basic " + credentials

     def authorizeSession(self, client):
         client.add_credentials(self.username, self.password)
