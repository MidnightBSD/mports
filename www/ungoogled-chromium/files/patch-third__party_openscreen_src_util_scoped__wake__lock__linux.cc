--- third_party/openscreen/src/util/scoped_wake_lock_linux.cc.orig	2026-10-26 21:13:13 UTC
+++ third_party/openscreen/src/util/scoped_wake_lock_linux.cc	2026-10-29 11:20:46 UTC
@@ -32,7 +32,12 @@
 // This mutex guards the reference count to ensure atomic transitions between
 // 0 and 1 references, which correspond to acquiring and releasing the physical
 // wake lock.
+#if defined(__FreeBSD__) || defined(__MidnightBSD__)
+NoDestructor<std::mutex> g_wake_lock_mutex_storage;
+std::mutex& g_wake_lock_mutex = *g_wake_lock_mutex_storage;
+#else
 std::mutex g_wake_lock_mutex;
+#endif
 
 // Use atomic pointers to allow thread-safe overriding in tests without
 // needing to lock the mutex just to read the paths or clock.
