--- src/FTVectoriser.cpp.orig
+++ src/FTVectoriser.cpp
@@ -168,7 +168,7 @@ void FTVectoriser::ProcessContours()
         int startIndex = outline->contours[c] == 0 ? 0 : outline->contours[c - 1] + 1;
         int endIndex = outline->contours[c];

-        char* tagList = &outline->tags[startIndex];
+        unsigned char* tagList = &outline->tags[startIndex];
         FT_Vector* pointList = &outline->points[startIndex];

         contourList[c] = new FTContour(pointList, tagList, endIndex - startIndex + 1);
