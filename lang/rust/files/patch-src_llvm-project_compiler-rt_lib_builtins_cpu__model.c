--- src/llvm-project/compiler-rt/lib/builtins/cpu_model.c.orig	2023-02-07 01:45:02.000000000 -0500
+++ src/llvm-project/compiler-rt/lib/builtins/cpu_model.c	2023-03-11 12:33:03.356058000 -0500
@@ -813,7 +813,7 @@
 #include <zircon/syscalls.h>
 #endif
 static void CONSTRUCTOR_ATTRIBUTE init_have_lse_atomics(void) {
-#if defined(__FreeBSD__)
+#if defined(__FreeBSD__) || defined(__MidnightBSD__)
   unsigned long hwcap;
   int result = elf_aux_info(AT_HWCAP, &hwcap, sizeof hwcap);
   __aarch64_have_lse_atomics = result == 0 && (hwcap & HWCAP_ATOMICS) != 0;
@@ -847,7 +847,7 @@
   }
 #endif // defined(__ANDROID__)
   __aarch64_have_lse_atomics = result;
-#endif // defined(__FreeBSD__)
+#endif // defined(__FreeBSD__) || defined(__MidnightBSD__)
 }
 #endif // defined(__has_include)
 #endif // __has_include(<sys/auxv.h>)
