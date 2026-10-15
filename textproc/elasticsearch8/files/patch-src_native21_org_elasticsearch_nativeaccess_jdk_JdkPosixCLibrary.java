--- src/native21/org/elasticsearch/nativeaccess/jdk/JdkPosixCLibrary.java.orig	2026-10-15 00:00:00 UTC
+++ src/native21/org/elasticsearch/nativeaccess/jdk/JdkPosixCLibrary.java
@@ -80,7 +80,9 @@
     static {
         MethodHandle fstat;
         try {
-            fstat = downcallHandleWithErrno("fstat64", FunctionDescriptor.of(JAVA_INT, JAVA_INT, ADDRESS));
+            String os = System.getProperty("os.name");
+            String symbol = os.startsWith("MidnightBSD") || os.startsWith("FreeBSD") ? "fstat" : "fstat64";
+            fstat = downcallHandleWithErrno(symbol, FunctionDescriptor.of(JAVA_INT, JAVA_INT, ADDRESS));
         } catch (LinkageError e) {
             // Due to different sizes of the stat structure for 32 vs 64 bit machines, on some systems fstat actually points to
             // an internal symbol. So we fall back to looking for that symbol.
