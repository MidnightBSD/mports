--- waflib/Context.py.orig	2022-08-31 15:39:43 UTC
+++ waflib/Context.py
@@ -9 +9 @@
-import os, re, imp, sys
+import os, re, sys, types
@@ -663 +663 @@
-	module = imp.new_module(WSCRIPT_FILE)
+	module = types.ModuleType(WSCRIPT_FILE)
