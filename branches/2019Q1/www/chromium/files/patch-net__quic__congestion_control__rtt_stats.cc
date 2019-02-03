--- ./net/quic/congestion_control/rtt_stats.cc.orig	2014-08-12 21:02:38.000000000 +0200
+++ ./net/quic/congestion_control/rtt_stats.cc	2014-08-13 09:56:58.000000000 +0200
@@ -73,7 +73,7 @@
   } else {
     mean_deviation_ = QuicTime::Delta::FromMicroseconds(
         kOneMinusBeta * mean_deviation_.ToMicroseconds() +
-        kBeta * std::abs(smoothed_rtt_.Subtract(rtt_sample).ToMicroseconds()));
+        kBeta * std::labs(smoothed_rtt_.Subtract(rtt_sample).ToMicroseconds()));
     smoothed_rtt_ = smoothed_rtt_.Multiply(kOneMinusAlpha).Add(
         rtt_sample.Multiply(kAlpha));
     DVLOG(1) << "Cubic; smoothed_rtt(us):" << smoothed_rtt_.ToMicroseconds()
