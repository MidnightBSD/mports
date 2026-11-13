--- buildbot/test/unit/www/test_ws.py.orig
+++ buildbot/test/unit/www/test_ws.py
@@ -176,7 +176,7 @@
     def test_on_connect_with_token(self):
         self.master.www = mock.Mock()
         self.master.www.site = mock.Mock()
-        self.master.www.site.session_secret = 'secret'
+        self.master.www.site.session_secret = 'test-session-secret-for-hs256-tests'
         self.master.www.authz = mock.Mock()
         self.master.www.authz.assertUserAllowed = mock.Mock(return_value=defer.succeed(None))
 
@@ -203,7 +203,7 @@
     def test_on_connect_with_expired_token(self):
         self.master.www = mock.Mock()
         self.master.www.site = mock.Mock()
-        self.master.www.site.session_secret = 'secret'
+        self.master.www.site.session_secret = 'test-session-secret-for-hs256-tests'
         self.master.www.authz = mock.Mock()
         self.master.www.authz.assertUserAllowed = mock.Mock(return_value=defer.succeed(None))
 
@@ -229,7 +229,7 @@
     def test_on_connect_invalid_token(self):
         self.master.www = mock.Mock()
         self.master.www.site = mock.Mock()
-        self.master.www.site.session_secret = 'secret'
+        self.master.www.site.session_secret = 'test-session-secret-for-hs256-tests'
         self.master.www.authz = mock.Mock()
 
         request = ConnectionRequest(
@@ -253,7 +253,7 @@
     def test_on_connect_with_ssl(self):
         self.master.www = mock.Mock()
         self.master.www.site = mock.Mock()
-        self.master.www.site.session_secret = 'secret'
+        self.master.www.site.session_secret = 'test-session-secret-for-hs256-tests'
         self.master.www.authz = mock.Mock()
         self.master.www.authz.assertUserAllowed = mock.Mock(return_value=defer.succeed(None))
 
@@ -281,7 +281,7 @@
     def test_on_connect_different_path(self):
         self.master.www = mock.Mock()
         self.master.www.site = mock.Mock()
-        self.master.www.site.session_secret = 'secret'
+        self.master.www.site.session_secret = 'test-session-secret-for-hs256-tests'
         self.master.www.authz = mock.Mock()
         self.master.www.authz.assertUserAllowed = mock.Mock(return_value=defer.succeed(None))
 
@@ -308,7 +308,7 @@
     def test_on_connect_direct_connection_deny(self):
         self.master.www = mock.Mock()
         self.master.www.site = mock.Mock()
-        self.master.www.site.session_secret = 'secret'
+        self.master.www.site.session_secret = 'test-session-secret-for-hs256-tests'
         self.master.www.authz = mock.Mock()
         self.master.www.authz.assertUserAllowed = mock.Mock(
             side_effect=ConnectionDeny(403, "Forbidden")
