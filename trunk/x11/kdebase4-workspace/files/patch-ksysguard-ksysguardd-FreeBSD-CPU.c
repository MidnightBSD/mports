--- ../ksysguard/ksysguardd/FreeBSD/CPU.c.orig	2008-04-15 04:26:36.000000000 +0200
+++ ../ksysguard/ksysguardd/FreeBSD/CPU.c	2008-04-15 04:39:27.000000000 +0200
@@ -49,11 +49,12 @@
 				   struct kinfo_cputime *);
 static struct kinfo_cputime cp_time, cp_old;
 
-#define        CPUSTATES       4
+#define        CPUSTATES       5
 #define        CP_USER         0
 #define        CP_NICE         1
 #define        CP_SYS          2
-#define        CP_IDLE         3
+#define        CP_INTR         3
+#define        CP_IDLE         4
 
 #else
 long percentages(int cnt, int *out, long *new, long *old, long *diffs);
@@ -74,6 +75,7 @@
 	registerMonitor("cpu/system/user", "integer", printCPUUser, printCPUUserInfo, sm);
 	registerMonitor("cpu/system/nice", "integer", printCPUNice, printCPUNiceInfo, sm);
 	registerMonitor("cpu/system/sys", "integer", printCPUSys, printCPUSysInfo, sm);
+	registerMonitor("cpu/system/intr", "integer", printCPUIntr, printCPUIntrInfo, sm);
 	registerMonitor("cpu/system/idle", "integer", printCPUIdle, printCPUIdleInfo, sm);
 
 	/* Monitor names changed from kde3 => kde4. Remain compatible with legacy requests when possible. */
@@ -91,6 +93,7 @@
 	removeMonitor("cpu/system/user");
 	removeMonitor("cpu/system/nice");
 	removeMonitor("cpu/system/sys");
+	removeMonitor("cpu/system/intr");
 	removeMonitor("cpu/system/idle");
 	
 	/* These were registered as legacy monitors */
@@ -151,6 +154,18 @@
 }
 
 void
+printCPUIntr(const char* cmd)
+{
+        fprintf(CurrentClient, "%d\n", cpu_states[CP_INTR]/10);
+}
+
+void
+printCPUIntrInfo(const char* cmd)
+{
+        fprintf(CurrentClient, "CPU Interrupt Load\t0\t100\t%%\n");
+}
+
+void
 printCPUIdle(const char* cmd)
 {
 	fprintf(CurrentClient, "%d\n", cpu_states[CP_IDLE]/10);
@@ -216,7 +231,8 @@
 
 	out[0] = ((diffs.cp_user * 1000LL + half_total) / total_change);
 	out[1] = ((diffs.cp_nice * 1000LL + half_total) / total_change);
-	out[2] = (((diffs.cp_sys + diffs.cp_intr) * 1000LL + half_total) / total_change);
+	out[2] = ((diffs.cp_sys * 1000LL + half_total) / total_change);
+	out[3] = ((diffs.cp_intr * 1000LL + half_total) / total_change);
 	out[4] = ((diffs.cp_idle * 1000LL + half_total) / total_change);
 }
 #else
