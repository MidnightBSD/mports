--- docs/conf.py.orig
+++ docs/conf.py
@@ -11,23 +11,23 @@
 # Link dates and other references in the changelog
 extensions += ['rst.linker']
 link_files = {
-    '../NEWS.rst': dict(
-        using=dict(GH='https://github.com'),
-        replace=[
-            dict(
-                pattern=r'(Issue #|\B#)(?P<issue>\d+)',
-                url='{package_url}/issues/{issue}',
-            ),
-            dict(
-                pattern=r'(?m:^((?P<scm_version>v?\d+(\.\d+){1,2}))\n[-=]+\n)',
-                with_scm='{text}\n{rev[timestamp]:%d %b %Y}\n',
-            ),
-            dict(
-                pattern=r'PEP[- ](?P<pep_number>\d+)',
-                url='https://peps.python.org/pep-{pep_number:0>4}/',
-            ),
+    '../NEWS.rst': {
+        'using': {'GH': 'https://github.com'},
+        'replace': [
+            {
+                'pattern': r'(Issue #|\B#)(?P<issue>\d+)',
+                'url': '{package_url}/issues/{issue}',
+            },
+            {
+                'pattern': r'(?m:^((?P<scm_version>v?\d+(\.\d+){1,2}))\n[-=]+\n)',
+                'with_scm': '{text}\n{rev[timestamp]:%d %b %Y}\n',
+            },
+            {
+                'pattern': r'PEP[- ](?P<pep_number>\d+)',
+                'url': 'https://peps.python.org/pep-{pep_number:0>4}/',
+            },
         ],
-    )
+    }
 }
 
 # Be strict about any broken references
