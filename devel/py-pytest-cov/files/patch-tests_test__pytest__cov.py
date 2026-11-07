Skip the Docker-backed Celery/Redis integration on MidnightBSD.

--- tests/test_pytest_cov.py.orig
+++ tests/test_pytest_cov.py
@@ -708,6 +708,7 @@
     assert result.ret == 0
 
 
+@pytest.mark.skipif(sys.platform.startswith('midnightbsd'), reason='Celery/Redis integration requires unavailable Docker containers')
 @pytest.mark.skipif(sys.platform == 'win32', reason='No redis server on Windows')
 @pytest.mark.skipif(sys.platform == 'darwin', reason='No redis server on OSX')
 def test_celery(pytester):
