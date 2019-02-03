--- hotspot/src/os_cpu/bsd_x86/vm/os_bsd_x86.cpp.orig	2016-09-03 19:12:16.574158549 -0400
+++ hotspot/src/os_cpu/bsd_x86/vm/os_bsd_x86.cpp	2016-09-03 19:12:32.133158958 -0400
@@ -94,7 +94,7 @@
 #define SPELL_REG_FP "ebp"
 #endif // AMD64
 
-#ifdef __FreeBSD__
+#ifdef __MidnightBSD__
 # define context_trapno uc_mcontext.mc_trapno
 # ifdef AMD64
 #  define context_pc uc_mcontext.mc_rip
