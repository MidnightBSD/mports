--- llm/llama.cpp/ggml/src/ggml.c.orig	2025-02-05 14:00:09.443459000 -0500
+++ llm/llama.cpp/ggml/src/ggml.c	2025-02-05 14:02:08.631679000 -0500
@@ -20502,8 +20502,10 @@
     }
 
     enum ggml_opt_result result = GGML_OPT_RESULT_OK;
-
+#pragma GCC diagnostic push
+#pragma GCC diagnostic ignored "-Wimplicit-function-declaration"
     struct ggml_opt_context * opt = (struct ggml_opt_context *) alloca(sizeof(struct ggml_opt_context));
+#pragma GCC diagnostic pop
 
     ggml_opt_init(ctx, opt, params, 0);
     result = ggml_opt_resume(ctx, opt, f);
