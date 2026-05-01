--- third_party/electron_node/src/node_buffer.cc.orig	2026-04-30 23:40:01.511825000 -0400
+++ third_party/electron_node/src/node_buffer.cc	2026-04-30 23:40:01.517374000 -0400
@@ -1422,7 +1422,7 @@
   CHECK(value >= 0 && value < maxSize);
   size_t size = static_cast<size_t>(value);
 #ifdef V8_ENABLE_SANDBOX
-  CHECK_LE(size, kMaxSafeBufferSizeForSandbox);
+  CHECK_LE(size, v8::internal::kMaxSafeBufferSizeForSandbox);
 #endif
   return size;
 }
@@ -1447,7 +1447,9 @@
     buf = ArrayBuffer::New(isolate, size);
   } else {
     std::unique_ptr<BackingStore> store =
-        ArrayBuffer::NewBackingStoreForNodeLTS(isolate, size);
+        ArrayBuffer::NewBackingStore(
+            isolate, size, v8::BackingStoreInitializationMode::kUninitialized,
+            v8::BackingStoreOnFailureMode::kReturnNull);
     if (!store) {
       return env->ThrowRangeError("Array buffer allocation failed");
     }
