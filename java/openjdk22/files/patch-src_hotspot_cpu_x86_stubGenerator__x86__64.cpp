Backport OpenJDK JDK-8393212 (CVE-2026-114938):
https://github.com/openjdk/jdk/commit/5177a70b385c16f26ede191fdac7aaba0bed0f8b

--- src/hotspot/cpu/x86/stubGenerator_x86_64.cpp.orig
+++ src/hotspot/cpu/x86/stubGenerator_x86_64.cpp
@@ -2531,3 +2531,7 @@
+    // A padded Base64 tail shorter than one complete block is handled by Java.
+    __ cmpl(length, 4);
+    __ jcc(Assembler::less, L_bruteForce);
+
     // I was going to let Java take care of the final fragment
     // however it will repeatedly call this routine for every 4 bytes
     // of input data, so handle the rest here.
