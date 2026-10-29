--- third_party/crashpad/crashpad/snapshot/posix/timezone.cc.orig	2026-10-26 21:13:13 UTC
+++ third_party/crashpad/crashpad/snapshot/posix/timezone.cc	2026-10-29 11:08:19 UTC
@@ -49,6 +49,9 @@
   // in the probes below. If tzname[1] is set to a bogus value, assume the
   // timezone does not actually use daylight saving time.
   if (daylight && strncmp(tzname[1], "_TZif", 5) != 0) {
+#elif BUILDFLAG(IS_BSD)
+  // BSD has no daylight global; use the probes below to detect transitions.
+  {
 #else
   if (daylight) {
 #endif
