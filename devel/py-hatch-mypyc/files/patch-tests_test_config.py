--- tests/test_config.py.orig	2026-11-14 07:39:13 +0000
+++ tests/test_config.py	2026-11-14 07:39:13 +0000
@@ -213 +213 @@
-                        'targets': {'wheel': {'exclude': ['foo'], 'hooks': {'mypyc': {}}}},
+                        'targets': {'wheel': {'only-include': ['foo', 'bar'], 'exclude': ['foo'], 'hooks': {'mypyc': {}}}},
@@ -247 +247 @@
-                        'targets': {'wheel': {'exclude': ['foo'], 'hooks': {'mypyc': {'exclude': ['baz.py']}}}},
+                        'targets': {'wheel': {'only-include': ['foo', 'bar'], 'exclude': ['foo'], 'hooks': {'mypyc': {'exclude': ['baz.py']}}}},
