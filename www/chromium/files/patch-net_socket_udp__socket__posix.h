--- net/socket/udp_socket_posix.h.orig	2026-10-26 21:13:14 UTC
+++ net/socket/udp_socket_posix.h	2026-10-29 03:50:57 UTC
@@ -450,12 +450,19 @@
       size_t buf_len,
       size_t maximum_packet_size);
 
-  // recvmmsg() and GRO are only available on Linux, ChromeOS, and Android.
+  // GRO is available on Linux, ChromeOS, and Android.
 #if BUILDFLAG(IS_LINUX) || BUILDFLAG(IS_CHROMEOS) || BUILDFLAG(IS_ANDROID)
   base::expected<DatagramsMetadata, Error> InternalReadMultipleWithGro(
       IOBuffer* buffer,
       size_t buf_len,
       size_t maximum_packet_size);
+  static base::expected<DatagramsMetadata, Error> ProcessGroResult(
+      const RecvmsgResult& res,
+      size_t maximum_packet_size);
+#endif
+
+  // recvmmsg() is also available on BSD.
+#if BUILDFLAG(IS_LINUX) || BUILDFLAG(IS_CHROMEOS) || BUILDFLAG(IS_ANDROID) || BUILDFLAG(IS_BSD)
   base::expected<DatagramsMetadata, Error> InternalRecvMmsg(
       IOBuffer* buffer,
       size_t num_messages,
@@ -463,9 +470,6 @@
   base::expected<DatagramsMetadata, Error> ProcessRecvMmsgResults(
       base::span<struct mmsghdr> mmsg,
       size_t maximum_packet_size);
-  static base::expected<DatagramsMetadata, Error> ProcessGroResult(
-      const RecvmsgResult& res,
-      size_t maximum_packet_size);
 #endif
 
   // An implementation of the InternalRecvFrom() method for reading data
