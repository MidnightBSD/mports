--- src/gpgsignkeyeditinteractor.cpp.orig	2025-06-03 15:35:00 UTC
+++ src/gpgsignkeyeditinteractor.cpp
@@ -214,6 +214,8 @@ static GpgSignKeyEditInteractor_Private::TransitionMap makeTable()
     addEntry(DUPE_OK2, GET_BOOL, "sign_uid.okay", CONFIRM);
     addEntry(DUPE_OK, GET_LINE, "trustsig_prompt.trust_value", SET_TRUST_VALUE);
     addEntry(DUPE_OK2, GET_LINE, "trustsig_prompt.trust_value", SET_TRUST_VALUE);
+    addEntry(DUPE_OK, GET_LINE, "sign_uid.expire", SET_EXPIRE);
+    addEntry(DUPE_OK2, GET_LINE, "sign_uid.expire", SET_EXPIRE);
     addEntry(CONFIRM, GET_BOOL, "sign_uid.okay", CONFIRM2);
     addEntry(CONFIRM2, GET_BOOL, "sign_uid.okay", CONFIRM);
     addEntry(CONFIRM, GET_LINE, "trustsig_prompt.trust_value", SET_TRUST_VALUE);
