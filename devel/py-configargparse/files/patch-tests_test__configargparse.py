--- tests/test_configargparse.py.orig
+++ tests/test_configargparse.py
@@ -13,6 +13,7 @@ import types
 import unittest
 from unittest import mock
 import warnings
+import yaml  # Load before tests temporarily replace sys.modules.
 import textwrap
 
 from io import BytesIO, StringIO
