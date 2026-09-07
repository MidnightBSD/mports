-- fmt 11 dropped the smart-pointer overloads of fmt::ptr, so pass the raw
-- pointer.
--- libtransmission/peer-msgs.cc.orig	2024-03-12 00:00:00 UTC
+++ libtransmission/peer-msgs.cc
@@ -1915,7 +1915,7 @@
     {
         auto const len = std::size(msgs->outMessages);
         /* flush the protocol messages */
-        logtrace(msgs, fmt::format(FMT_STRING("flushing outMessages... to {:p} (length is {:d})"), fmt::ptr(msgs->io), len));
+        logtrace(msgs, fmt::format(FMT_STRING("flushing outMessages... to {:p} (length is {:d})"), fmt::ptr(msgs->io.get()), len));
         msgs->io->write(msgs->outMessages, false);
         msgs->clientSentAnythingAt = now;
         msgs->outMessagesBatchedAt = 0;
