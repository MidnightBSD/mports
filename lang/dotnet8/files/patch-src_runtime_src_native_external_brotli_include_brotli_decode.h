--- src/runtime/src/native/external/brotli/include/brotli/decode.h.orig
+++ src/runtime/src/native/external/brotli/include/brotli/decode.h
@@ -84,8 +84,9 @@
   BROTLI_ERROR_CODE(_ERROR_FORMAT_, PADDING_1, -14) SEPARATOR              \
   BROTLI_ERROR_CODE(_ERROR_FORMAT_, PADDING_2, -15) SEPARATOR              \
   BROTLI_ERROR_CODE(_ERROR_FORMAT_, DISTANCE, -16) SEPARATOR               \
+  BROTLI_ERROR_CODE(_ERROR_FORMAT_, BLOCK_SWITCH, -17) SEPARATOR           \
                                                                            \
-  /* -17..-18 codes are reserved */                                        \
+  /* Code -18 is reserved */                                               \
                                                                            \
   BROTLI_ERROR_CODE(_ERROR_, DICTIONARY_NOT_SET, -19) SEPARATOR            \
   BROTLI_ERROR_CODE(_ERROR_, INVALID_ARGUMENTS, -20) SEPARATOR             \
