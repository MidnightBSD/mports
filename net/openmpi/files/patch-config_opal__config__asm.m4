--- config/opal_config_asm.m4.orig
+++ config/opal_config_asm.m4
@@ -275,7 +275,18 @@
   # CFLAGS/LIBS.
   OPAL_ASM_CHECK_ATOMIC_FUNC([__sync_bool_compare_and_swap],
       [AC_LANG_SOURCE(OPAL_SYNC_BOOL_COMPARE_AND_SWAP_TEST_SOURCE)],
-      [sync_bool_compare_and_swap_128_result=1],
+      [dnl A software lock does not synchronize with the separate pointer CAS
+       dnl operations used by the counted-pointer LIFO and FIFO.
+       AC_MSG_CHECKING([if __sync 128-bit compare-and-swap is always lock-free])
+       AC_COMPILE_IFELSE([AC_LANG_PROGRAM([], [[
+           _Static_assert(__atomic_always_lock_free(16, 0), "128-bit CAS must be lock-free");
+       ]])],
+         [sync_bool_compare_and_swap_128_result=1
+          AC_MSG_RESULT([yes])],
+         [sync_bool_compare_and_swap_128_result=0
+          CFLAGS=$opal_asm_check_func_CFLAGS_save
+          LIBS=$opal_asm_check_func_LIBS_save
+          AC_MSG_RESULT([no])])],
       [sync_bool_compare_and_swap_128_result=0])
 
   AC_DEFINE_UNQUOTED([OPAL_HAVE_SYNC_BUILTIN_CSWAP_INT128],
