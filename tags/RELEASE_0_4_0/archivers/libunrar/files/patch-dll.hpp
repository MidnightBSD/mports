--- dll.hpp	2008-11-06 01:37:37.000000000 +0100
+++ dll.hpp	2008-11-06 01:38:47.000000000 +0100
@@ -28,14 +28,14 @@
 
 #define RAR_DLL_VERSION       4
 
-#ifdef _UNIX
+// #ifdef _UNIX
 #define CALLBACK
 #define PASCAL
 #define LONG long
 #define HANDLE void *
 #define LPARAM long
 #define UINT unsigned int
-#endif
+// #endif
 
 struct RARHeaderData
 {
