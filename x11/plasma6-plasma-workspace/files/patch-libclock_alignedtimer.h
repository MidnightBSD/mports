MidnightBSD 4.0 (FreeBSD 13 base) has no sys/timerfd.h. Guard the
timerfd path and fall back to a wall-clock aligned QTimer.

--- libclock/alignedtimer.h.orig
+++ libclock/alignedtimer.h
@@ -9,6 +9,8 @@
 #include <chrono>
 #include <memory>
 
+class QTimer;
+
 class AlignedTimer : public QObject
 {
     Q_OBJECT
@@ -26,4 +28,5 @@
     void initTimer();
     std::chrono::seconds m_interval;
     int m_timerFd = -1;
+    QTimer *m_timer = nullptr;
 };
