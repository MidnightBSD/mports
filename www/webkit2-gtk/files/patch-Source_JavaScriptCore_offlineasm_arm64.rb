--- Source/JavaScriptCore/offlineasm/arm64.rb.orig
+++ Source/JavaScriptCore/offlineasm/arm64.rb
@@ -1440,1 +1440,1 @@
-            $asm.putStr("#elif OS(LINUX)")
+            $asm.putStr("#elif OS(LINUX) || OS(FREEBSD)")
