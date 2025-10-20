--- src/cross_compile.rs.orig	2024-03-21 12:30:28 UTC
+++ src/cross_compile.rs
@@ -39,7 +39,7 @@ pub fn is_cross_compiling(target: &Target) -> Result<b
         }
     }
 
-    Ok(true)
+    Ok(false)
 }
 
 /// Parse sysconfigdata file
