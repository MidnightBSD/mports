Keep the upstream HTTP fixture on the loopback interface.

--- tests/test_copc.py.orig
+++ tests/test_copc.py
@@ -114,7 +114,8 @@
 )
 def test_copc_over_http():
     server_proc = subprocess.Popen(
-        [sys.executable, "-m", "RangeHTTPServer"], cwd=str(Path(__file__).parent)
+        [sys.executable, "-m", "RangeHTTPServer", "--bind", "127.0.0.1"],
+        cwd=str(Path(__file__).parent)
     )
 
     with laspy.CopcReader.open(
