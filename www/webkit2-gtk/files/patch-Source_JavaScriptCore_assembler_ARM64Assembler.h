--- Source/JavaScriptCore/assembler/ARM64Assembler.h.orig
+++ Source/JavaScriptCore/assembler/ARM64Assembler.h
@@ -3905,1 +3905,3 @@
         linuxPageFlush(current, end);
+#elif OS(FREEBSD)
+        __clear_cache(code, reinterpret_cast<char*>(code) + size);
