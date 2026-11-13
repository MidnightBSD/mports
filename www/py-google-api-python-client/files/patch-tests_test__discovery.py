--- tests/test_discovery.py.orig
+++ tests/test_discovery.py
@@ -558,7 +558,9 @@
                 static_discovery=False,
             )
 
-    def test_credentials_and_credentials_file_mutually_exclusive(self):
+    @mock.patch("googleapiclient.discovery._retrieve_discovery_doc",
+                return_value=read_datafile("plus.json"))
+    def test_credentials_and_credentials_file_mutually_exclusive(self, mock_discovery):
         with self.assertRaises(google.api_core.exceptions.DuplicateCredentialArgs):
             build(
                 "plus",
@@ -569,6 +571,7 @@
                 ),
                 static_discovery=False,
             )
+        mock_discovery.assert_called_once()
 
 
 class DiscoveryFromDocument(unittest.TestCase):
@@ -2756,7 +2759,9 @@
                     ),
                 )
 
-        def test_client_options_universe_configured_with_mtls(self):
+        @mock.patch("googleapiclient._auth.default_credentials",
+                    return_value=google.auth.credentials.AnonymousCredentials())
+        def test_client_options_universe_configured_with_mtls(self, mock_default_credentials):
             fake_universe = "foo.com"
             discovery = read_datafile("tasks.json")
 
@@ -2770,6 +2775,7 @@
                             universe_domain=fake_universe
                         ),
                     )
+            mock_default_credentials.assert_called_once()
 
         def test_client_options_universe_configured_with_api_override(self):
             fake_universe = "foo.com"
@@ -2800,7 +2806,9 @@
                         credentials=credentials,
                     )
 
-        def test_universe_env_var_configured_with_mtls(self):
+        @mock.patch("googleapiclient._auth.default_credentials",
+                    return_value=google.auth.credentials.AnonymousCredentials())
+        def test_universe_env_var_configured_with_mtls(self, mock_default_credentials):
             fake_universe = "foo.com"
             discovery = read_datafile("tasks.json")
 
@@ -2813,6 +2821,7 @@
                     },
                 ):
                     tasks = build_from_document(discovery)
+            mock_default_credentials.assert_called_once()
 
         def test_universe_env_var_configured_with_api_override(self):
             fake_universe = "foo.com"
