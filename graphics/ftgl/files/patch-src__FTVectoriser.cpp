--- src/FTVectoriser.cpp.orig
+++ src/FTVectoriser.cpp
@@ -158,7 +158,7 @@ void FTVectoriser::ProcessContours()
     for(int i = 0; i < ftContourCount; ++i)
     {
         FT_Vector* pointList = &outline.points[startIndex];
-        char* tagList = &outline.tags[startIndex];
+        char* tagList = (char*)&outline.tags[startIndex];

         endIndex = outline.contours[i];
         contourLength =  (endIndex - startIndex) + 1;
