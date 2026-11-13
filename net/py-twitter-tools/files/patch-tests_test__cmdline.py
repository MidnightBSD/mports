--- tests/test_cmdline.py.orig
+++ tests/test_cmdline.py
@@ -57,3 +57,26 @@
                 "text": "test & test",
             }
         )
+
+
+class TestOfflineHelp(unittest.TestCase):
+    def test_help_needs_no_config_credentials_or_network(self):
+        from contextlib import redirect_stdout
+        from io import StringIO
+        from unittest.mock import patch
+        from twitter import cmdline
+
+        for option in ('-h', '--help'):
+            with self.subTest(option=option):
+                output = StringIO()
+                with patch.object(cmdline, 'loadConfig') as config, \
+                     patch.object(cmdline, 'oauth_dance') as authorize, \
+                     patch.object(cmdline, 'read_token_file') as tokens, \
+                     patch.object(cmdline, 'Twitter') as client, \
+                     redirect_stdout(output):
+                    self.assertIsNone(cmdline.main([option]))
+                self.assertEqual(output.getvalue(), cmdline.__doc__ + '\n')
+                config.assert_not_called()
+                authorize.assert_not_called()
+                tokens.assert_not_called()
+                client.assert_not_called()
