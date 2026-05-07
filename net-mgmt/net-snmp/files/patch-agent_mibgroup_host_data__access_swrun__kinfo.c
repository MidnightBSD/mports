--- agent/mibgroup/host/data_access/swrun_kinfo.c.orig
+++ agent/mibgroup/host/data_access/swrun_kinfo.c
@@ -50,7 +50,7 @@
 #include "swrun_private.h"
 #include "../../../kernel.h"

-#if defined(freebsd5) && __FreeBSD_version >= 500014
+#if (defined(freebsd5) && __FreeBSD_version >= 500014) || defined(__MidnightBSD_version)
     /*
      * later FreeBSD kinfo_proc field names
      */
@@ -325,7 +325,7 @@
 #endif

-#if defined(freebsd5) && __FreeBSD_version >= 500014
+#if (defined(freebsd5) && __FreeBSD_version >= 500014) || defined(__MidnightBSD_version)
          entry->hrSWRunPerfCPU  = (proc_table[i].ki_rusage.ru_utime.tv_sec*1000000 + proc_table[i].ki_rusage.ru_utime.tv_usec) / 10000;
 	 entry->hrSWRunPerfCPU += (proc_table[i].ki_rusage.ru_stime.tv_sec*1000000 + proc_table[i].ki_rusage.ru_stime.tv_usec) / 10000;
 	 entry->hrSWRunPerfCPU += (proc_table[i].ki_rusage_ch.ru_utime.tv_sec*1000000 + proc_table[i].ki_rusage_ch.ru_utime.tv_usec) / 10000;
