--- ui/webui/resources/tools/minify_js.py.orig	2026-10-26 21:13:13 UTC
+++ ui/webui/resources/tools/minify_js.py
@@ -36,6 +36,7 @@
   # launching NodeJS once for every input file.
   node.RunNode(
     [
+      '--jitless',
       os.path.join(_HERE_PATH, 'minify_js.js'),
       '--in_folder',
       in_path,
