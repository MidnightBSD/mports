OpenCASCADE 8 removed Geom2dLProp_CLProps2d; the 2D curve local
properties class is now the GeomLProp_CLProps2d alias declared in
GeomLProp_CLProps.hxx.

--- src/geo/OCCEdge.cpp.orig	2025-01-01 00:00:00 UTC
+++ src/geo/OCCEdge.cpp
@@ -16,7 +16,12 @@
 
 #include <Standard_Version.hxx>
 #include <TopoDS.hxx>
+#if OCC_VERSION_HEX >= 0x080000
+#include <GeomLProp_CLProps.hxx>
+#define Geom2dLProp_CLProps2d GeomLProp_CLProps2d
+#else
 #include <Geom2dLProp_CLProps2d.hxx>
+#endif
 #include <Geom_BezierCurve.hxx>
 #include <Geom_OffsetCurve.hxx>
 #include <Geom_Ellipse.hxx>
