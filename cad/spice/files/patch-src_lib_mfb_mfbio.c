--- src/lib/mfb/mfbio.c.orig	1990-11-05 19:53:33 UTC
+++ src/lib/mfb/mfbio.c
@@ -1047,7 +1047,7 @@ MFBType()
     if(MFBCurrent->deviceType != TTY)
     return(NULL);
     Int1 = 0;
-    c[1] = NULL;
+    c[1] = '\0';
     OldTextMode = MFBCurrent->textMode;
     OldForeground = MFBCurrent->fgColorId;
     OldFillPattern = MFBCurrent->fillPattern;
