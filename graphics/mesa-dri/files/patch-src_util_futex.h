--- src/util/futex.h.orig	2019-06-26 16:14:08.000000000 -0400
+++ src/util/futex.h	2020-06-11 12:55:49.145655000 -0400
@@ -29,10 +29,33 @@
 #include <limits.h>
 #include <stdint.h>
 #include <unistd.h>
+#if defined(__FreeBSD__) || defined(__MidnightBSD__)
+#include <errno.h>
+#include <machine/atomic.h>
+#include <sys/umtx.h>
+#else
 #include <linux/futex.h>
 #include <sys/syscall.h>
+#endif
 #include <sys/time.h>
 
+#if defined(__FreeBSD__) || defined(__MidnightBSD__)
+static inline int futex_wake(uint32_t *addr, int count)
+{
+   return _umtx_op(addr, UMTX_OP_WAKE, (uint32_t)count, NULL, NULL) == -1 ? errno : 0;
+}
+
+static inline int futex_wait(uint32_t *addr, int32_t value, struct timespec *timeout)
+{
+   void *uaddr = NULL, *uaddr2 = NULL;
+   if (timeout != NULL) {
+      const struct _umtx_time tmo = { ._timeout = *timeout, ._flags = UMTX_ABSTIME, ._clockid = CLOCK_MONOTONIC };
+      uaddr = (void *)(uintptr_t)sizeof(tmo);
+      uaddr2 = (void *)&tmo;
+   }
+   return _umtx_op(addr, UMTX_OP_WAIT_UINT, (uint32_t)value, uaddr, uaddr2) == -1 ? errno : 0;
+}
+#else
 static inline long sys_futex(void *addr1, int op, int val1, const struct timespec *timeout, void *addr2, int val3)
 {
    return syscall(SYS_futex, addr1, op, val1, timeout, addr2, val3);
@@ -50,6 +73,7 @@
    return sys_futex(addr, FUTEX_WAIT_BITSET, value, timeout, NULL,
                     FUTEX_BITSET_MATCH_ANY);
 }
+#endif
 
 #endif
 
