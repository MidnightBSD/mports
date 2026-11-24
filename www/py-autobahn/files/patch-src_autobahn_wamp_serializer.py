--- src/autobahn/wamp/serializer.py.orig
+++ src/autobahn/wamp/serializer.py
@@ -912,19 +912,4 @@
-# The WAMP "ubjson" serializer is backed by the `bjdata` package (Binary JData),
-# a maintained successor of the (unmaintained) `py-ubjson` package.
-# https://pypi.org/project/bjdata/  https://github.com/NeuroJSON/pybj
-#
-# `bjdata` is an OPTIONAL, CPython-only dependency: install it via the
-# `autobahn[serialization]` extra. It is published as an sdist only (no PyPI
-# wheels) and builds a C extension at install time (and pulls in numpy); on
-# CPython without a compiler, set PYBJDATA_NO_EXTENSION=1 for a pure-Python build.
-# bjdata cannot currently be installed on PyPy (its sdist build pulls an
-# unbuildable numpy - see NeuroJSON/pybj#6), so the UBJSON serializer is
-# unavailable on PyPy; use the always-available `cbor`/`msgpack` serializers there
-# (and generally for wheels-only / cross-arch deployments).
-#
-# NOTE: bjdata's on-the-wire (octet-level) encoding is NOT identical to the older
-# py-ubjson/UBJSON bytes (e.g. unsigned-integer markers, little-endian). The WAMP
-# serializer id remains "ubjson" for transport negotiation. See the changelog.
+# The WAMP "ubjson" serializer uses py-ubjson to preserve its established wire encoding.
 try:
-    import bjdata as ubjson
+    import ubjson
 except ImportError:
     pass
