--- MdeModulePkg/Library/BrotliCustomDecompressLib/brotli/c/include/brotli/decode.h.orig	2022-01-10 10:08:10 UTC
+++ MdeModulePkg/Library/BrotliCustomDecompressLib/brotli/c/include/brotli/decode.h
@@ -85,9 +85,7 @@ typedef enum {
   BROTLI_ERROR_CODE(_ERROR_FORMAT_, PADDING_1, -14) SEPARATOR              \
   BROTLI_ERROR_CODE(_ERROR_FORMAT_, PADDING_2, -15) SEPARATOR              \
   BROTLI_ERROR_CODE(_ERROR_FORMAT_, DISTANCE, -16) SEPARATOR               \
-                                                                           \
-  /* -17 code is reserved */                                               \
-                                                                           \
+  BROTLI_ERROR_CODE(_ERROR_FORMAT_, BLOCK_SWITCH, -17) SEPARATOR           \
   BROTLI_ERROR_CODE(_ERROR_, COMPOUND_DICTIONARY, -18) SEPARATOR           \
   BROTLI_ERROR_CODE(_ERROR_, DICTIONARY_NOT_SET, -19) SEPARATOR            \
   BROTLI_ERROR_CODE(_ERROR_, INVALID_ARGUMENTS, -20) SEPARATOR             \
