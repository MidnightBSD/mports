--- crt/aws-lc/crypto/fipsmodule/cpucap/cpu_ppc64le.c.orig	2024-05-22 18:19:52 UTC
+++ crt/aws-lc/crypto/fipsmodule/cpucap/cpu_ppc64le.c
@@ -27,7 +27,11 @@
 extern uint8_t OPENSSL_cpucap_initialized;
 
 void OPENSSL_cpuid_setup(void) {
+#if defined(__linux__)
   OPENSSL_ppc64le_hwcap2 = getauxval(AT_HWCAP2);
+#elif defined(__FreeBSD__)
+  elf_aux_info(AT_HWCAP2, &OPENSSL_ppc64le_hwcap2, sizeof(OPENSSL_ppc64le_hwcap2));
+#endif
   OPENSSL_cpucap_initialized = 1;
 }
 
