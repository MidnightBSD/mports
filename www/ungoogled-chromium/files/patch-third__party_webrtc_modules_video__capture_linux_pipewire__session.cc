--- third_party/webrtc/modules/video_capture/linux/pipewire_session.cc.orig	2026-10-26 21:13:13 UTC
+++ third_party/webrtc/modules/video_capture/linux/pipewire_session.cc	2026-10-29 04:32:21 UTC
@@ -45,11 +45,6 @@
 
 namespace webrtc {
 namespace videocapturemodule {
-
-// Checks that the pod matches the expected type and is large enough to hold it.
-static bool SpaValueIsType(const spa_pod* val, uint32_t type) {
-  return val->type == type && val->size >= spa_pod_type_size(type);
-}
 
 VideoType PipeWireRawFormatToVideoType(uint32_t id) {
   switch (id) {
@@ -192,7 +187,7 @@
   prop = spa_pod_object_find_prop(obj, prop, SPA_FORMAT_VIDEO_framerate);
   if (prop) {
     val = spa_pod_get_values(&prop->value, &n_items, &choice);
-    if (SpaValueIsType(val, SPA_TYPE_Fraction)) {
+    if (spa_pod_is_fraction(val)) {
       spa_fraction* fract;
 
       fract = static_cast<spa_fraction*>(SPA_POD_BODY(val));
@@ -217,7 +212,7 @@
     return;
 
   val = spa_pod_get_values(&prop->value, &n_items, &choice);
-  if (!SpaValueIsType(val, SPA_TYPE_Rectangle))
+  if (!spa_pod_is_rectangle(val))
     return;
 
   if (choice != SPA_CHOICE_None || n_items < 1)
@@ -275,7 +270,7 @@
       return false;
 
     val = spa_pod_get_values(&prop->value, &n_items, &choice);
-    if (!SpaValueIsType(val, SPA_TYPE_Id))
+    if (!spa_pod_is_id(val))
       return false;
 
     if (choice != SPA_CHOICE_None || n_items < 1)
