OpenCASCADE 8 dropped the TopTools_*IteratorOf* convenience headers; the
iterator types are now nested in the collection classes.

--- src/geo/GModelIO_OCC.cpp.orig	2025-01-01 00:00:00 UTC
+++ src/geo/GModelIO_OCC.cpp
@@ -113,9 +113,23 @@
 #include <TColgp_HArray1OfPnt.hxx>
 #include <TopExp.hxx>
 #include <TopExp_Explorer.hxx>
+#if OCC_VERSION_HEX >= 0x080000
+#include <TopTools_DataMapOfIntegerShape.hxx>
+#include <TopTools_DataMapOfShapeInteger.hxx>
+#include <TopTools_ListOfShape.hxx>
+#include <TopTools_MapOfShape.hxx>
+#include <Interface_HArray1OfHAsciiString.hxx>
+#include <TDF_LabelSequence.hxx>
+typedef TopTools_DataMapOfIntegerShape::Iterator
+  TopTools_DataMapIteratorOfDataMapOfIntegerShape;
+typedef TopTools_DataMapOfShapeInteger::Iterator
+  TopTools_DataMapIteratorOfDataMapOfShapeInteger;
+typedef TopTools_ListOfShape::Iterator TopTools_ListIteratorOfListOfShape;
+#else
 #include <TopTools_DataMapIteratorOfDataMapOfIntegerShape.hxx>
 #include <TopTools_DataMapIteratorOfDataMapOfShapeInteger.hxx>
 #include <TopTools_ListIteratorOfListOfShape.hxx>
+#endif
 #include <TopoDS.hxx>
 #include <gce_MakeCirc.hxx>
 #include <gce_MakeElips.hxx>
