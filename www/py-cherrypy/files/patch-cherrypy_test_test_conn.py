--- cherrypy/test/test_conn.py
+++ cherrypy/test/test_conn.py
@@ -6,7 +6,10 @@
 import time
 import urllib.parse
 from http.client import BadStatusLine, HTTPConnection, NotConnected
+from importlib.metadata import version
 
+from packaging.version import Version
+
 from cheroot.test import webtest
 
 import cherrypy
@@ -753,6 +756,8 @@
     cherrypy.config.update({
         'server.max_request_body_size': 1001,
         'server.socket_timeout': 10,
+        # Exercise the accepted queue, not the kernel listen backlog.
+        'server.socket_queue_size': 128,
         'server.accepted_queue_size': 5,
         'server.accepted_queue_timeout': 0.1,
     })
@@ -811,23 +816,29 @@
                 overflow_conn.sock,
                 method='GET',
             )
-            try:
+            # Cheroot 11.0.0rc1 and newer send an explicit 503 when the
+            # accepted queue is full; older versions reset the connection.
+            if Version(version('cheroot')) >= Version('11.0.0rc1'):
                 response.begin()
-            except socket.error as exc:
-                if exc.args[0] in socket_reset_errors:
-                    pass  # Expected.
+                self.assertEqual(response.status, 503)
+            else:
+                try:
+                    response.begin()
+                except socket.error as exc:
+                    if exc.args[0] in socket_reset_errors:
+                        pass  # Expected.
+                    else:
+                        tmpl = (
+                            'Overflow conn did not get RST. '
+                            'Got {exc.args!r} instead'
+                        )
+                        raise AssertionError(tmpl.format(**locals()))
+                except BadStatusLine:
+                    # This is a special case in OS X. Linux and Windows will
+                    # RST correctly.
+                    assert sys.platform == 'darwin'
                 else:
-                    tmpl = (
-                        'Overflow conn did not get RST. '
-                        'Got {exc.args!r} instead'
-                    )
-                    raise AssertionError(tmpl.format(**locals()))
-            except BadStatusLine:
-                # This is a special case in OS X. Linux and Windows will
-                # RST correctly.
-                assert sys.platform == 'darwin'
-            else:
-                raise AssertionError('Overflow conn did not get RST ')
+                    raise AssertionError('Overflow conn did not get RST ')
         finally:
             for conn in conns:
                 conn.send(b'done')
