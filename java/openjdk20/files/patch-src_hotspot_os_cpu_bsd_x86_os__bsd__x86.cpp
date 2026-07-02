--- src/hotspot/os_cpu/bsd_x86/os_bsd_x86.cpp.orig	2026-07-03 00:05:00 UTC
+++ src/hotspot/os_cpu/bsd_x86/os_bsd_x86.cpp
@@ -475,7 +475,7 @@ JVM_handle_bsd_signal(int sig,
 
       if ((sig == SIGSEGV || sig == SIGBUS) && SafepointMechanism::is_poll_address((address)info->si_addr)) {
         stub = SharedRuntime::get_poll_stub(pc);
-#if defined(__APPLE__)
+#if defined(__APPLE__) || defined(__MidnightBSD__)
       // 32-bit Darwin reports a SIGBUS for nearly all memory access exceptions.
       // 64-bit Darwin may also use a SIGBUS (seen with compressed oops).
       // Catching SIGBUS here prevents the implicit SIGBUS NULL check below from
