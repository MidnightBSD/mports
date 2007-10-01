--- extensions/transformiix/source/base/Double.cpp.orig	Mon Feb  6 15:40:52 2006
+++ extensions/transformiix/source/base/Double.cpp	Mon Feb  6 15:51:01 2006
@@ -52,11 +52,16 @@
 //A trick to handle IEEE floating point exceptions on FreeBSD - E.D.
 #ifdef __FreeBSD__
 #include <ieeefp.h>
-#ifdef __alpha__
-fp_except_t allmask = FP_X_INV|FP_X_OFL|FP_X_UFL|FP_X_DZ|FP_X_IMP;
-#else
-fp_except_t allmask = FP_X_INV|FP_X_OFL|FP_X_UFL|FP_X_DZ|FP_X_IMP|FP_X_DNML;
+#if !defined(FP_X_DNML)
+#define FP_X_DNML 0
 #endif
+#if !defined(FP_X_STK)
+#define FP_X_STK 0
+#endif
+#if !defined(FP_X_IOV)
+#define FP_X_IOV 0
+#endif
+fp_except_t allmask = FP_X_INV|FP_X_OFL|FP_X_UFL|FP_X_DZ|FP_X_IMP|FP_X_DNML|FP_X_STK|FP_X_IOV;
 fp_except_t oldmask = fpsetmask(~allmask);
 #endif
 
