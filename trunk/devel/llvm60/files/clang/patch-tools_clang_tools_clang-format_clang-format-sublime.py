
$FreeBSD: head/devel/llvm60/files/clang/patch-tools_clang_tools_clang-format_clang-format-sublime.py 460063 2018-01-26 23:47:28Z brooks $

--- tools/clang/tools/clang-format/clang-format-sublime.py.orig
+++ tools/clang/tools/clang-format/clang-format-sublime.py
@@ -18,7 +18,7 @@
 import subprocess
 
 # Change this to the full path if clang-format is not on the path.
-binary = 'clang-format'
+binary = 'clang-format%%LLVM_SUFFIX%%'
 
 # Change this to format according to other formatting styles. See the output of
 # 'clang-format --help' for a list of supported styles. The default looks for
