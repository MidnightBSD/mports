--- src/native/org/elasticsearch/nativeaccess/lib/NativeLibrary.java.orig	2026-10-15 00:00:00 UTC
+++ src/native/org/elasticsearch/nativeaccess/lib/NativeLibrary.java
@@ -11,4 +11,4 @@
 
 /** A marker interface for libraries that can be loaded by {@link org.elasticsearch.nativeaccess.lib.NativeLibraryProvider} */
 public sealed interface NativeLibrary permits JavaLibrary, PosixCLibrary, LinuxCLibrary, MacCLibrary, Kernel32Library, VectorLibrary,
-    ZstdLibrary {}
+    ZstdLibrary, BsdCLibrary {}
