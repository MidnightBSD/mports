--- src/af/xap/xp/xap_Dialog.cpp.orig	2019-04-03 22:06:58 UTC
+++ src/af/xap/xp/xap_Dialog.cpp
@@ -267,7 +267,7 @@ XAP_Dialog_Modeless::BuildWindowName(char * pWindowNam
 // This function constructs and returns the window name of a modeless dialog by
 // concatenating the active frame with the dialog name

-	*pWindowName = (char) NULL;
+	*pWindowName = (char)(size_t) NULL;
	UT_UTF8String wn = UT_UTF8String(pDialogName);

	XAP_Frame* pFrame = getActiveFrame();
