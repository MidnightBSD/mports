--- vcg/complex/algorithms/update/selection.h.orig	2020-09-18 11:29:23 UTC
+++ vcg/complex/algorithms/update/selection.h
@@ -99,7 +99,7 @@ class SelectionStack
     fsHandle fsH = fsV.back();
     tsHandle tsH = tsV.back();
 
-    if(! (Allocator<ComputeMeshType>::template IsValidHandle(*_m, vsH))) return false;
+    if(! (Allocator<ComputeMeshType>::template IsValidHandle<bool>(*_m, vsH))) return false;
 
     for(auto vi = _m->vert.begin(); vi != _m->vert.end(); ++vi)
       if( !(*vi).IsD() )
