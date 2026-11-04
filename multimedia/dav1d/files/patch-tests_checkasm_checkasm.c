Drop after FreeBSD 12.4 EOL around 2023-12-31
FreeBSD >= 13.1 pulls cpu_set_t from <sched.h> via <pthread.h>

https://cgit.freebsd.org/src/commit/?id=379bfb2aa9e9

--- tests/checkasm/checkasm.c.orig	2025-01-19 21:33:54 UTC
+++ tests/checkasm/checkasm.c
@@ -734,7 +734,11 @@ int main(int argc, char *argv[]) {
                 fprintf(stderr, "checkasm: running on cpu %lu\n", affinity);
             }
 #elif HAVE_PTHREAD_SETAFFINITY_NP && defined(CPU_SET)
+#if defined(__MidnightBSD__)
+            cpuset_t set;
+#else
             cpu_set_t set;
+#endif
             CPU_ZERO(&set);
             CPU_SET(affinity, &set);
             if (pthread_setaffinity_np(pthread_self(), sizeof(set), &set)) {
