--- build/linux/strip_binary.py.orig	2026-10-26 21:13:13 UTC
+++ build/linux/strip_binary.py
@@ -10,6 +10,7 @@
 
 
 def main() -> int:
+    return 0
     parser = argparse.ArgumentParser(
         description="Strip binary using LLVM tools."
     )
