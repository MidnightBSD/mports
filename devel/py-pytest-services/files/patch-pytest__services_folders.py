--- pytest_services/folders.py.orig
+++ pytest_services/folders.py
@@ -12,7 +12,7 @@
     return '/tmp'
 
 
-@pytest.yield_fixture(scope='session')
+@pytest.fixture(scope='session')
 def base_dir(request, session_id, root_dir, services_log):
     """The directory where test run artifacts should be stored.
 
@@ -52,7 +52,7 @@
     return root_dir
 
 
-@pytest.yield_fixture(scope='session')
+@pytest.fixture(scope='session')
 def memory_base_dir(request, session_id, memory_root_dir, services_log):
     """The directory where memory test run artifacts should be stored.
 
