--- writerfilter/source/ooxml/RefAndPointer.hxx.orig
+++ writerfilter/source/ooxml/RefAndPointer.hxx
@@ -101,7 +101,7 @@
     RefAndPointer & operator=
     (const RefAndPointer & rSrc)
     {
-        set(rSrc.getHandler());
+        set(rSrc.getPointer());
 
         return *this;
