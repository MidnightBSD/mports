--- tests/test_testresult.py.orig
+++ tests/test_testresult.py
@@ -3405,7 +3405,7 @@
     def test_os_error(self):
         """Locale error messages from the OS shouldn't break anything"""
         textoutput = self._test_external_case(
-            modulelevel="import os", testline="os.mkdir('/')"
+            modulelevel="import os", testline="os.mkdir('.')"
         )
         self.assertThat(textoutput, self._local_os_error_matcher())
 
