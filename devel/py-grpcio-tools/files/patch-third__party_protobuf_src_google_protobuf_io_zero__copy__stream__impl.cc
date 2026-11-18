--- third_party/protobuf/src/google/protobuf/io/zero_copy_stream_impl.cc.orig
+++ third_party/protobuf/src/google/protobuf/io/zero_copy_stream_impl.cc
@@ -21,0 +22,4 @@
+
+#ifndef isascii
+#define isascii(c) (((c) & ~0x7f) == 0)
+#endif
