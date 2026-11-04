--- src/native21/org/elasticsearch/nativeaccess/jdk/JdkNativeLibraryProvider.java.orig	2026-10-15 00:00:00 UTC
+++ src/native21/org/elasticsearch/nativeaccess/jdk/JdkNativeLibraryProvider.java
@@ -9,6 +9,7 @@
 
 package org.elasticsearch.nativeaccess.jdk;
 
+import org.elasticsearch.nativeaccess.lib.BsdCLibrary;
 import org.elasticsearch.nativeaccess.lib.JavaLibrary;
 import org.elasticsearch.nativeaccess.lib.Kernel32Library;
 import org.elasticsearch.nativeaccess.lib.LinuxCLibrary;
@@ -39,7 +40,9 @@
                 ZstdLibrary.class,
                 JdkZstdLibrary::new,
                 VectorLibrary.class,
-                JdkVectorLibrary::new
+                JdkVectorLibrary::new,
+                BsdCLibrary.class,
+                JdkBsdCLibrary::new
             )
         );
     }
