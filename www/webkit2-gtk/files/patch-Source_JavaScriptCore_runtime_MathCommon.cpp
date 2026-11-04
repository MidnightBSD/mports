--- Source/JavaScriptCore/runtime/MathCommon.cpp.orig	2026-03-18 00:00:00 UTC
+++ Source/JavaScriptCore/runtime/MathCommon.cpp
@@ -607,4 +607,4 @@
-#if (OS(LINUX) && !defined(__GLIBC__)) || OS(HAIKU)
+#if (OS(LINUX) && !defined(__GLIBC__)) || OS(HAIKU) || OS(FREEBSD)
 static inline float roundevenf(float operand)
 {
     float rounded = roundf(operand);
