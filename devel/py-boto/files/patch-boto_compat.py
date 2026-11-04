--- boto/compat.py.orig
+++ boto/compat.py
@@ -49 +49 @@
-from boto.vendored import six
+import six
@@ -51 +51 @@
-from boto.vendored.six import BytesIO, StringIO
+from six import BytesIO, StringIO
@@ -52 +52 @@
-from boto.vendored.six.moves import filter, http_client, map, _thread, \
+from six.moves import filter, http_client, map, _thread, \
@@ -54 +54 @@
-from boto.vendored.six.moves.queue import Queue
+from six.moves.queue import Queue
@@ -55 +55 @@
-from boto.vendored.six.moves.urllib.parse import parse_qs, quote, unquote, \
+from six.moves.urllib.parse import parse_qs, quote, unquote, \
@@ -57 +57 @@
-from boto.vendored.six.moves.urllib.parse import unquote_plus
+from six.moves.urllib.parse import unquote_plus
@@ -58 +58 @@
-from boto.vendored.six.moves.urllib.request import urlopen
+from six.moves.urllib.request import urlopen
