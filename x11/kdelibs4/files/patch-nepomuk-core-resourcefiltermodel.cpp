--- ../nepomuk/core/resourcefiltermodel.cpp.orig	Wed Dec 10 01:37:24 2008
+++ ../nepomuk/core/resourcefiltermodel.cpp	Wed Dec 10 01:37:35 2008
@@ -47,11 +47,6 @@
     return qHash( node.toString() );
 }
 
-// @deprecated: just for keeping binary compatibility
-uint qHash( const Soprano::Node& node )
-{
-    return Soprano::qHash( node );
-}
 
 class Nepomuk::ResourceFilterModel::Private
 {
