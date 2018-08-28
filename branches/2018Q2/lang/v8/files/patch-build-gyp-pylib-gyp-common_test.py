--- build/gyp/pylib/gyp/common_test.py.orig	2016-12-27 19:30:38.000000000 -0500
+++ build/gyp/pylib/gyp/common_test.py	2016-12-27 19:31:11.000000000 -0500
@@ -56,6 +56,7 @@
     self.assertEqual(expected, gyp.common.GetFlavor(param))
 
   def test_platform_default(self):
+    self.assertFlavor('midnightbsd', 'freebsd9' , {})
     self.assertFlavor('freebsd', 'freebsd9' , {})
     self.assertFlavor('freebsd', 'freebsd10', {})
     self.assertFlavor('solaris', 'sunos5'   , {});
