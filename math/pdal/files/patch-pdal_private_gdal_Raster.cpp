--- pdal/private/gdal/Raster.cpp.orig	2026-11-12 01:59:55 UTC
+++ pdal/private/gdal/Raster.cpp
@@ -690,7 +690,7 @@ MetadataNode Raster::getMetadata(std::string domain) c
 
 MetadataNode Raster::getMetadata(std::string domain) const
 {
-    char **papszMetadata = NULL;
+    CSLConstList papszMetadata = NULL;
 
     MetadataNode output("raster");
 
