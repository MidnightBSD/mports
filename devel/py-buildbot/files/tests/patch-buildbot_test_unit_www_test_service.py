--- buildbot/test/unit/www/test_service.py.orig
+++ buildbot/test/unit/www/test_service.py
@@ -38,6 +38,9 @@
 class FakeChannel:
     transport = None
 
+    def __init__(self, site):
+        self.site = site
+
     def isSecure(self):
         return False
 
@@ -216,7 +219,7 @@
 
 
 class TestBuildbotSite(unittest.SynchronousTestCase):
-    SECRET = 'secret'
+    SECRET = 'test-session-secret-for-hs256-tests'
 
     def setUp(self):
         self.site = service.BuildbotSite(None, "logs", 0, 0)
@@ -258,7 +261,7 @@
 
     def test_updateSession(self):
         session = self.site.makeSession()
-        request = Request(FakeChannel(), False)
+        request = Request(FakeChannel(self.site), False)
         request.sitepath = [b"bb"]
         session.updateSession(request)
         self.assertEqual(len(request.cookies), 1)
@@ -268,5 +271,5 @@
         self.assertIn('exp', decoded)
 
     def test_absentServerHeader(self):
-        request = Request(FakeChannel(), False)
+        request = Request(FakeChannel(self.site), False)
         self.assertEqual(request.responseHeaders.hasHeader('Server'), False)
