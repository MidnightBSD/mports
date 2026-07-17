--- setup.py.orig
+++ setup.py
@@ -6,56 +6,6 @@
 
 from os.path import join, dirname
 from setuptools import setup, find_packages, __version__ as setuptools_version
-from pkg_resources import parse_version
-
-import pkg_resources
-
-try:
-    import _markerlib.markers
-except ImportError:
-    _markerlib = None
-
-
-# _markerlib.default_environment() obtains its data from _VARS
-# and wraps it in another dict, but _markerlib_evaluate writes
-# to the dict while it is iterating the keys, causing an error
-# on Python 3 only.
-# Replace _markerlib.default_environment to return a custom dict
-# that has all the necessary markers, and ignores any writes.
-
-class Python3MarkerDict(dict):
-
-    def __setitem__(self, key, value):
-        pass
-
-    def pop(self, i=-1):
-        return self[i]
-
-
-if _markerlib and sys.version_info[0] == 3:
-    env = _markerlib.markers._VARS
-    for key in list(env.keys()):
-        new_key = key.replace('.', '_')
-        if new_key != key:
-            env[new_key] = env[key]
-
-    _markerlib.markers._VARS = Python3MarkerDict(env)
-
-    def default_environment():
-        return _markerlib.markers._VARS
-
-    _markerlib.default_environment = default_environment
-
-# Avoid the very buggy pkg_resources.parser, which doesn't consistently
-# recognise the markers needed by this setup.py
-# Change this to setuptools 20.10.0 to support all markers.
-if pkg_resources:
-    if parse_version(setuptools_version) < parse_version('18.5'):
-        MarkerEvaluation = pkg_resources.MarkerEvaluation
-
-        del pkg_resources.parser
-        pkg_resources.evaluate_marker = MarkerEvaluation._markerlib_evaluate
-        MarkerEvaluation.evaluate_marker = MarkerEvaluation._markerlib_evaluate
 
 classifiers = [
