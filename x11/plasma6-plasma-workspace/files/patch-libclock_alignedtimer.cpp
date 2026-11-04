MidnightBSD 4.0 (FreeBSD 13 base) has no sys/timerfd.h. Guard the
timerfd path with __has_include and fall back to a single-shot QTimer
re-armed against the wall clock, keeping ticks aligned to the interval
boundary. A clock step is corrected within one interval instead of
being detected immediately via TFD_TIMER_CANCEL_ON_SET.

--- libclock/alignedtimer.cpp.orig
+++ libclock/alignedtimer.cpp
@@ -6,11 +6,16 @@
 #include "alignedtimer.h"
 
 #include <fcntl.h>
+#if __has_include(<sys/timerfd.h>)
+#define HAVE_TIMERFD 1
 #include <sys/timerfd.h>
+#endif
 #include <unistd.h>
 
+#include <QDateTime>
 #include <QDebug>
 #include <QSocketNotifier>
+#include <QTimer>
 
 #ifndef Q_OS_LINUX
 #include <QDBusConnection>
@@ -53,6 +58,7 @@
 AlignedTimer::AlignedTimer(std::chrono::seconds interval)
     : m_interval(interval)
 {
+#ifdef HAVE_TIMERFD
     m_timerFd = timerfd_create(CLOCK_REALTIME, O_CLOEXEC | O_NONBLOCK);
 
     auto notifier = new QSocketNotifier(m_timerFd, QSocketNotifier::Read, this);
@@ -65,6 +71,19 @@
         Q_EMIT timeout();
     });
     initTimer();
+#else
+    // No timerfd in the base system. Use a single-shot QTimer that is
+    // re-armed against the wall clock after every tick, so ticks stay aligned
+    // to the interval boundary and a clock step is corrected within one
+    // interval rather than being detected immediately.
+    m_timer = new QTimer(this);
+    m_timer->setSingleShot(true);
+    connect(m_timer, &QTimer::timeout, this, [this]() {
+        Q_EMIT timeout();
+        initTimer();
+    });
+    initTimer();
+#endif
 }
 
 AlignedTimer::~AlignedTimer()
@@ -76,6 +95,7 @@
 
 void AlignedTimer::initTimer()
 {
+#ifdef HAVE_TIMERFD
     itimerspec timespec = {{0, 0}, {0, 0}};
     timespec.it_value.tv_sec = m_interval.count();
     timespec.it_interval.tv_sec = m_interval.count();
@@ -87,4 +107,16 @@
         qWarning() << "Could not create timer. The clock will not function correctly. Error:" << QString::fromLatin1(strerror(err));
         return;
     }
+#else
+    const qint64 intervalMs = std::chrono::milliseconds(m_interval).count();
+    if (intervalMs <= 0) {
+        return;
+    }
+    // Fire on the next wall-clock boundary of m_interval.
+    qint64 delay = intervalMs - (QDateTime::currentMSecsSinceEpoch() % intervalMs);
+    if (delay <= 0) {
+        delay = intervalMs;
+    }
+    m_timer->start(std::chrono::milliseconds(delay));
+#endif
 }
