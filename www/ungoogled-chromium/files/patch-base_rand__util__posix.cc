--- base/rand_util_posix.cc.orig	2026-10-26 21:13:13 UTC
+++ base/rand_util_posix.cc
@@ -31,7 +31,7 @@
 #include "base/system/sys_info.h"
 #endif  // BUILDFLAG(IS_MAC)
 
-#if BUILDFLAG(IS_LINUX) || BUILDFLAG(IS_CHROMEOS)
+#if (BUILDFLAG(IS_LINUX) || BUILDFLAG(IS_CHROMEOS)) && !BUILDFLAG(IS_BSD)
 #include "third_party/lss/linux_syscall_support.h"
 #endif  // BUILDFLAG(IS_LINUX) || BUILDFLAG(IS_CHROMEOS)
 
@@ -41,6 +41,7 @@
 
 #if !BUILDFLAG(IS_APPLE)
 
+#if !BUILDFLAG(IS_BSD)
 #if BUILDFLAG(IS_AIX)
 // AIX has no 64-bit support for O_CLOEXEC.
 static constexpr int kOpenFlags = O_RDONLY;
@@ -67,8 +68,9 @@
 };
 
 #endif  // !BUILDFLAG(IS_APPLE)
+#endif
 
-#if BUILDFLAG(IS_LINUX) || BUILDFLAG(IS_CHROMEOS) || BUILDFLAG(IS_ANDROID)
+#if (BUILDFLAG(IS_LINUX) || BUILDFLAG(IS_CHROMEOS) || BUILDFLAG(IS_ANDROID)) && !BUILDFLAG(IS_BSD)
 
 bool KernelSupportsGetRandom() {
   return base::SysInfo::KernelVersionNumber::Current() >=
@@ -121,6 +123,7 @@
 namespace {
 
 void RandBytesInternal(span<uint8_t> output, bool avoid_allocation) {
+#if !BUILDFLAG(IS_BSD)
   // The BoringSSL experiment takes priority over everything else.
   if (!avoid_allocation && internal::UseBoringSSLForRandBytes()) {
     // BoringSSL's RAND_bytes always returns 1. Any error aborts the program.
@@ -151,6 +154,9 @@
   const bool success = ReadFromFD(urandom_fd, as_writable_chars(output));
   CHECK(success);
 #endif  // BUILDFLAG(IS_MAC)
+#else
+  arc4random_buf(output.data(), output.size());
+#endif
 }
 
 }  // namespace
@@ -171,10 +177,12 @@
 }
 
 #if !BUILDFLAG(IS_APPLE)
+#if !BUILDFLAG(IS_BSD)
 int GetUrandomFD() {
   static NoDestructor<URandomFd> urandom_fd;
   return urandom_fd->fd();
 }
+#endif
 #endif  // !BUILDFLAG(IS_APPLE)
 
 }  // namespace base
