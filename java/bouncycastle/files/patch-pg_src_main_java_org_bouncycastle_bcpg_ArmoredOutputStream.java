--- pg/src/main/java/org/bouncycastle/bcpg/ArmoredOutputStream.java.orig
+++ pg/src/main/java/org/bouncycastle/bcpg/ArmoredOutputStream.java
@@ -621,7 +621,7 @@
 
             if (comment.length() > availableCommentCharsPerLine)
             {
-                comment = comment.substring(0, availableCommentCharsPerLine - 1) + '…';
+                comment = comment.substring(0, availableCommentCharsPerLine - 1) + '\u2026';
             }
