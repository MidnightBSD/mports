--- tornado/test/netutil_test.py.orig
+++ tornado/test/netutil_test.py
@@ -2,6 +2,7 @@
 import signal
 import socket
 from subprocess import Popen
+from types import SimpleNamespace
 import sys
 import time
 import unittest
@@ -168,6 +169,63 @@
         self.resolver = CaresResolver()
 
 
+@unittest.skipIf(pycares is None, "pycares module not present")
+class CaresResolverCompatibilityTest(AsyncTestCase):
+    def setUp(self):
+        super().setUp()
+        self.resolver = CaresResolver()
+
+    @gen_test
+    async def test_old_api_and_family_validation(self):
+        class LegacyChannel:
+            def gethostbyname(self, host, family, callback):
+                self.called = (host, family)
+                if host == "error.invalid":
+                    callback(None, pycares.errno.ARES_ENOTFOUND)
+                    return
+                callback(SimpleNamespace(addresses=["127.0.0.1"]), None)
+
+        channel = LegacyChannel()
+        self.resolver.channel = channel
+        result = await self.resolver.resolve("example.invalid", 42, socket.AF_INET)
+        self.assertEqual(channel.called, ("example.invalid", socket.AF_INET))
+        self.assertEqual(result, [(socket.AF_INET, ("127.0.0.1", 42))])
+        with self.assertRaisesRegex(OSError, "Requested socket family"):
+            await self.resolver.resolve("example.invalid", 42, socket.AF_INET6)
+        with self.assertRaisesRegex(OSError, "C-Ares returned error"):
+            await self.resolver.resolve("error.invalid", 42)
+
+    @gen_test
+    async def test_new_api_families_error_and_numeric(self):
+        class ModernChannel:
+            def getaddrinfo(self, host, port, *, family, type, callback):
+                self.called = (host, port, family, type)
+                if host == "error.invalid":
+                    callback(None, pycares.errno.ARES_ENOTFOUND)
+                    return
+                node4 = SimpleNamespace(addr=(b"127.0.0.1", port))
+                node6 = SimpleNamespace(addr=(b"::1", port, 0, 0))
+                nodes = {socket.AF_INET: [node4], socket.AF_INET6: [node6],
+                         socket.AF_UNSPEC: [node4, node6]}[family]
+                callback(SimpleNamespace(nodes=nodes), None)
+
+        channel = ModernChannel()
+        self.resolver.channel = channel
+        for family, expected in (
+            (socket.AF_INET, [(socket.AF_INET, ("127.0.0.1", 42))]),
+            (socket.AF_INET6, [(socket.AF_INET6, ("::1", 42))]),
+            (socket.AF_UNSPEC, [(socket.AF_INET, ("127.0.0.1", 42)),
+                                (socket.AF_INET6, ("::1", 42))]),
+        ):
+            self.assertEqual(await self.resolver.resolve("example.invalid", 42, family), expected)
+            self.assertEqual(channel.called, ("example.invalid", 42, family, socket.SOCK_STREAM))
+        with self.assertRaisesRegex(OSError, "C-Ares returned error"):
+            await self.resolver.resolve("error.invalid", 42)
+        self.assertEqual(await self.resolver.resolve("127.0.0.1", 43),
+                         [(socket.AF_INET, ("127.0.0.1", 43))])
+        self.assertEqual(channel.called[0], "error.invalid")
+
+
 class IsValidIPTest(unittest.TestCase):
     def test_is_valid_ip(self):
         self.assertTrue(is_valid_ip("127.0.0.1"))
