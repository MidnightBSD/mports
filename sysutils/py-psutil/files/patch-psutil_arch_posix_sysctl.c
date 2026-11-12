Obtained from:	https://github.com/giampaolo/psutil/commit/04794aa03cb9d30287e8e7fd9c80acc8c4f2aa46

--- psutil/arch/posix/sysctl.c.orig	2026-01-12 08:59:45 UTC
+++ psutil/arch/posix/sysctl.c
@@ -31,4 +31,4 @@ psutil_sysctl(int *mib, u_int miblen, void *buf, size_
-    if (len != buflen) {
+    if (len > buflen) {
         psutil_runtime_error("sysctl() size mismatch");
         return -1;
     }
@@ -142,4 +142,4 @@ psutil_sysctlbyname(const char *name, void *buf, size_
-    if (len != buflen) {
+    if (len > buflen) {
         str_format(
             errbuf,
             sizeof(errbuf),
