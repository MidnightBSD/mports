--- tornado/platform/caresresolver.py.orig
+++ tornado/platform/caresresolver.py
@@ -19,7 +19,7 @@
     same results as the system resolver, but can be used for non-blocking
     resolution when threads cannot be used.
 
-    ``pycares`` will not return a mix of ``AF_INET`` and ``AF_INET6`` when
+    Older ``pycares`` releases do not return a mix of ``AF_INET`` and ``AF_INET6`` when
     ``family`` is ``AF_UNSPEC``, so it is only recommended for use in
     ``AF_INET`` (i.e. IPv4).  This is the default for
     ``tornado.simple_httpclient``, but other libraries may default to
@@ -66,18 +66,29 @@
         if is_valid_ip(host):
             addresses = [host]
         else:
-            # gethostbyname doesn't take callback as a kwarg
             fut = Future()  # type: Future[Tuple[Any, Any]]
-            self.channel.gethostbyname(
-                host, family, lambda result, error: fut.set_result((result, error))
-            )
+            callback = lambda result, error: fut.set_result((result, error))
+            if hasattr(self.channel, "gethostbyname"):
+                self.channel.gethostbyname(host, family, callback)
+            else:
+                self.channel.getaddrinfo(
+                    host, port, family=family, type=socket.SOCK_STREAM, callback=callback
+                )
             result, error = yield fut
             if error:
                 raise OSError(
                     "C-Ares returned error %s: %s while resolving %s"
                     % (error, pycares.errno.strerror(error), host)
                 )
-            addresses = result.addresses
+            if hasattr(self.channel, "gethostbyname"):
+                addresses = result.addresses
+            else:
+                addresses = [
+                    node.addr[0].decode("ascii")
+                    if isinstance(node.addr[0], bytes)
+                    else node.addr[0]
+                    for node in result.nodes
+                ]
         addrinfo = []
         for address in addresses:
             if "." in address:
