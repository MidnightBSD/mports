--- projects/demo/demo.cpp.orig	2026-05-29 14:21:07 UTC
+++ projects/demo/demo.cpp
@@ -308,7 +308,9 @@ int main( int argc, char *argv[] )
   free( data.wvout );
 
   delete data.voicer;
+#if defined(__STK_REALTIME__)
   delete dac;
+#endif
 
   for ( i=0; i<data.nVoices; i++ ) delete data.instrument[i];
   free( data.instrument );
