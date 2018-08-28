--- hotspot/agent/src/os/bsd/ps_proc.c.orig	2016-08-22 10:01:50.000000000 -0400
+++ hotspot/agent/src/os/bsd/ps_proc.c	2016-09-03 19:05:18.668158852 -0400
@@ -293,7 +299,7 @@
 #endif // __FreeBSD__ && __FreeBSD_version < 701000
 
 static bool read_lib_info(struct ps_prochandle* ph) {
-#if defined(__FreeBSD__) && __FreeBSD_version >= 701000
+#if defined(__MidnightBSD__) 
   struct kinfo_vmentry *freep, *kve;
   int i, cnt;
 
