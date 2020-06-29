--- Source/WebCore/dom/Document.cpp.orig	2020-06-28 15:35:27.511386000 -0400
+++ Source/WebCore/dom/Document.cpp	2020-06-28 15:35:53.302023000 -0400
@@ -4711,12 +4711,12 @@
     unsigned i = 0;
 
     UChar32 c;
-    U16_NEXT(characters, i, length, c)
+    U16_NEXT(characters, i, length, c);
     if (!isValidNameStart(c))
         return false;
 
     while (i < length) {
-        U16_NEXT(characters, i, length, c)
+        U16_NEXT(characters, i, length, c);
         if (!isValidNamePart(c))
             return false;
     }
@@ -4776,7 +4776,7 @@
 
     for (unsigned i = 0; i < length; ) {
         UChar32 c;
-        U16_NEXT(qualifiedName, i, length, c)
+        U16_NEXT(qualifiedName, i, length, c);
         if (c == ':') {
             if (sawColon)
                 return Exception { InvalidCharacterError };
