--- SPIRV/SpvTools.cpp.orig	2025-02-10 00:00:00 UTC
+++ SPIRV/SpvTools.cpp
@@ -165,8 +165,10 @@ void SpirvToolsValidate(const glslang::TIntermediat
     spv_validator_options options = spvValidatorOptionsCreate();
     spvValidatorOptionsSetRelaxBlockLayout(options, intermediate.usingHlslOffsets());
     spvValidatorOptionsSetBeforeHlslLegalization(options, prelegalization);
     spvValidatorOptionsSetScalarBlockLayout(options, intermediate.usingScalarBlockLayout());
     spvValidatorOptionsSetWorkgroupScalarBlockLayout(options, intermediate.usingScalarBlockLayout());
-    spvValidatorOptionsSetAllowOffsetTextureOperand(options, intermediate.usingTextureOffsetNonConst());
-    spvValidatorOptionsSetAllowVulkan32BitBitwise(options, true);
+    /*
+     * Keep compatibility with external SPIRV-Tools as shipped in MidnightBSD:
+     * these validator option setters are not available in spirv-tools-2024.4.r2.
+     */
     spvValidateWithOptions(context, options, &binary, &diagnostic);
