--- tests/git_test.py.orig
+++ tests/git_test.py
@@ -65,7 +65,7 @@
 
     @unittest.mock.patch.dict(
         os.environ,
-        {'TRAVIS_BRANCH': 'master'},
+        {'TRAVIS_BRANCH': 'master', 'PATH': os.environ.get('PATH', os.defpath)},
         clear=True,
     )
     def test_git(self):
@@ -164,6 +164,7 @@
     @unittest.mock.patch.dict(
         os.environ, {
             'GITHUB_ACTIONS': 'true',
+            'PATH': os.environ.get('PATH', os.defpath),
             'GITHUB_REF': 'refs/pull/1234/merge',
             'GITHUB_SHA': 'bb0e00166b28f49db04d6a8b8cb4bddb5afa529f',
             'GITHUB_HEAD_REF': 'fixup-branch',
@@ -177,6 +178,7 @@
     @unittest.mock.patch.dict(
         os.environ, {
             'GITHUB_ACTIONS': 'true',
+            'PATH': os.environ.get('PATH', os.defpath),
             'GITHUB_REF': 'refs/heads/master',
             'GITHUB_SHA': 'bb0e00166b28f49db04d6a8b8cb4bddb5afa529f',
             'GITHUB_HEAD_REF': '',
@@ -190,6 +192,7 @@
     @unittest.mock.patch.dict(
         os.environ, {
             'GITHUB_ACTIONS': 'true',
+            'PATH': os.environ.get('PATH', os.defpath),
             'GITHUB_REF': 'refs/tags/v1.0',
             'GITHUB_SHA': 'bb0e00166b28f49db04d6a8b8cb4bddb5afa529f',
             'GITHUB_HEAD_REF': '',
