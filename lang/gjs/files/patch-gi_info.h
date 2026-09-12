--- gi/info.h.orig
+++ gi/info.h
@@ -886 +886 @@
-    void** closure_native_address(ffi_closure* closure) const {
+    void* closure_native_address(ffi_closure* closure) const {
