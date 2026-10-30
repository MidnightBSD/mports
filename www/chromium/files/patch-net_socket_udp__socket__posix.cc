--- net/socket/udp_socket_posix.cc.orig	2026-10-26 21:13:14 UTC
+++ net/socket/udp_socket_posix.cc	2026-10-29 03:50:57 UTC
@@ -80,6 +80,10 @@
 #include "base/mac/mac_util.h"
 #endif  // BUILDFLAG(IS_MAC)
 
+#if !defined(CMSG_ALIGN)
+#define CMSG_ALIGN(n) _ALIGN(n)
+#endif
+
 namespace net {
 
 namespace {
@@ -87,7 +91,7 @@
 constexpr int kBindRetries = 10;
 constexpr int kPortStart = 1024;
 constexpr int kPortEnd = 65535;
-#if BUILDFLAG(IS_LINUX) || BUILDFLAG(IS_CHROMEOS) || BUILDFLAG(IS_ANDROID)
+#if BUILDFLAG(IS_LINUX) || BUILDFLAG(IS_CHROMEOS) || BUILDFLAG(IS_ANDROID) || BUILDFLAG(IS_BSD)
 // Maximum number of UDP packets that can be read at a time from recvmmsg.
 constexpr size_t kMaxMmsgMessages = 128;
 #endif
@@ -145,7 +149,7 @@
 }
 #endif  // BUILDFLAG(IS_MAC)
 
-#if !BUILDFLAG(IS_ANDROID) && !BUILDFLAG(IS_IOS) && !BUILDFLAG(IS_FUCHSIA)
+#if !BUILDFLAG(IS_ANDROID) && !BUILDFLAG(IS_IOS) && !BUILDFLAG(IS_FUCHSIA) && !BUILDFLAG(IS_BSD)
 // Helper for IPv4 SSM. Sets sin_len on macOS, no-op on Linux.
 group_source_req CreateIPv4SourceGroupRequest(const IPAddress& group_address,
                                               const IPAddress& source_address,
@@ -305,6 +309,12 @@
                                 base::checked_cast<int>(packet_count));
   }
 }
+
+}  // namespace
+#endif
+
+#if BUILDFLAG(IS_LINUX) || BUILDFLAG(IS_CHROMEOS) || BUILDFLAG(IS_ANDROID) || BUILDFLAG(IS_BSD)
+namespace {
 
 void RecordRecvMmsgPacketsRead(size_t packet_count) {
   if (base::ShouldRecordSubsampledMetric(0.01)) {
@@ -530,7 +540,7 @@
   // when reading coalesced superpackets (e.g. UDP GRO).
   CHECK_GE(buf_len, kMinimumReadMultipleBufferSize);
 
-#if BUILDFLAG(IS_LINUX) || BUILDFLAG(IS_CHROMEOS) || BUILDFLAG(IS_ANDROID)
+#if BUILDFLAG(IS_LINUX) || BUILDFLAG(IS_CHROMEOS) || BUILDFLAG(IS_ANDROID) || BUILDFLAG(IS_BSD)
   if (gro_status_ == GroStatus::kUnconfigured) {
     if (base::FeatureList::IsEnabled(features::kEnableUdpGro)) {
       ConfigureGroSocketOption();
@@ -829,12 +839,17 @@
 #endif  // BUILDFLAG(IS_APPLE)
   }
 
+#ifdef IP_RECVTOS
   int rv = setsockopt(socket_, IPPROTO_IP, IP_RECVTOS, &ecn, sizeof(ecn));
+#else
+  int rv = -1;
+  errno = EOPNOTSUPP;
+#endif
   return rv == 0 ? OK : MapSystemError(errno);
 }
 
 void UDPSocketPosix::SetMsgConfirm(bool confirm) {
-#if !BUILDFLAG(IS_APPLE)
+#if !BUILDFLAG(IS_APPLE) && !BUILDFLAG(IS_BSD)
   if (confirm) {
     sendto_flags_ |= MSG_CONFIRM;
   } else {
@@ -855,7 +870,7 @@
   DCHECK_CALLED_ON_VALID_THREAD(thread_checker_);
   int value = broadcast ? 1 : 0;
   int rv;
-#if BUILDFLAG(IS_APPLE)
+#if BUILDFLAG(IS_APPLE) || BUILDFLAG(IS_BSD)
   // SO_REUSEPORT on OSX permits multiple processes to each receive
   // UDP multicast or broadcast datagrams destined for the bound
   // port.
@@ -1175,6 +1190,8 @@
   if (gro_status_ == GroStatus::kEnabled) {
     return InternalReadMultipleWithGro(buffer, buf_len, maximum_packet_size);
   }
+#endif
+#if BUILDFLAG(IS_LINUX) || BUILDFLAG(IS_CHROMEOS) || BUILDFLAG(IS_ANDROID) || BUILDFLAG(IS_BSD)
   return InternalRecvMmsg(buffer, buf_len / maximum_packet_size,
                           maximum_packet_size);
 #else
@@ -1182,7 +1199,7 @@
 #endif
 }
 
-#if BUILDFLAG(IS_LINUX) || BUILDFLAG(IS_CHROMEOS) || BUILDFLAG(IS_ANDROID)
+#if BUILDFLAG(IS_LINUX) || BUILDFLAG(IS_CHROMEOS) || BUILDFLAG(IS_ANDROID) || BUILDFLAG(IS_BSD)
 base::expected<DatagramsMetadata, Error> UDPSocketPosix::InternalRecvMmsg(
     IOBuffer* buffer,
     size_t num_messages,
@@ -1277,6 +1294,9 @@
   return datagrams;
 }
 
+#endif
+
+#if BUILDFLAG(IS_LINUX) || BUILDFLAG(IS_CHROMEOS) || BUILDFLAG(IS_ANDROID)
 base::expected<DatagramsMetadata, Error>
 UDPSocketPosix::InternalReadMultipleWithGro(IOBuffer* buffer,
                                             size_t buf_len,
@@ -1554,7 +1574,7 @@
 #if BUILDFLAG(IS_CHROMEOS)
   if (last_error == EINVAL)
     return ERR_ADDRESS_IN_USE;
-#elif BUILDFLAG(IS_APPLE)
+#elif BUILDFLAG(IS_APPLE) || BUILDFLAG(IS_BSD)
   if (last_error == EADDRNOTAVAIL)
     return ERR_ADDRESS_IN_USE;
 #endif
@@ -1654,7 +1674,7 @@
 int UDPSocketPosix::SetSourceGroupMembership(const IPAddress& group_address,
                                              const IPAddress& source_address,
                                              int option) const {
-#if BUILDFLAG(IS_ANDROID) || BUILDFLAG(IS_IOS) || BUILDFLAG(IS_FUCHSIA)
+#if BUILDFLAG(IS_ANDROID) || BUILDFLAG(IS_IOS) || BUILDFLAG(IS_FUCHSIA) || BUILDFLAG(IS_BSD)
   return ERR_NOT_IMPLEMENTED;
 #else
   uint32_t interface_index = multicast_interface_;
@@ -1680,6 +1700,10 @@
 #endif
 }
 
+#if !defined(MCAST_JOIN_SOURCE_GROUP)
+#define MCAST_JOIN_SOURCE_GROUP 0
+#endif
+
 int UDPSocketPosix::JoinSourceGroup(const IPAddress& group_address,
                                     const IPAddress& source_address) const {
   DCHECK_CALLED_ON_VALID_THREAD(thread_checker_);
@@ -1695,6 +1719,10 @@
   return SetSourceGroupMembership(group_address, source_address,
                                   MCAST_JOIN_SOURCE_GROUP);
 }
+
+#if !defined(MCAST_LEAVE_SOURCE_GROUP)
+#define MCAST_LEAVE_SOURCE_GROUP 0
+#endif
 
 int UDPSocketPosix::LeaveSourceGroup(const IPAddress& group_address,
                                      const IPAddress& source_address) const {
