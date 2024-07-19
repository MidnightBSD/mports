--- src/cross_compile.rs.orig	2024-07-18 20:44:43.331893000 -0400
+++ src/cross_compile.rs	2024-07-18 20:45:29.286832000 -0400
@@ -39,7 +39,7 @@
         }
     }
 
-    Ok(true)
+    Ok(false)
 }
 
 /// Parse sysconfigdata file
