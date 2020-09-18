--- psutil/_psbsd.py.orig	2020-09-18 15:22:22.862674000 -0400
+++ psutil/_psbsd.py	2020-09-18 15:34:57.511800000 -0400
@@ -20,6 +20,7 @@
 from ._common import conn_tmap
 from ._common import conn_to_ntuple
 from ._common import FREEBSD
+from ._common import MIDNIGHT
 from ._common import memoize
 from ._common import memoize_when_activated
 from ._common import NETBSD
@@ -41,7 +42,7 @@
 # =====================================================================
 
 
-if FREEBSD:
+if FREEBSD or MIDNIGHTBSD:
     PROC_STATUSES = {
         cext.SIDL: _common.STATUS_IDLE,
         cext.SRUN: _common.STATUS_RUNNING,
@@ -165,7 +166,7 @@
 pmmap_ext = namedtuple(
     'pmmap_ext', 'addr, perms path rss, private, ref_count, shadow_count')
 # psutil.disk_io_counters()
-if FREEBSD:
+if FREEBSD or MIDNIGHTBSD:
     sdiskio = namedtuple('sdiskio', ['read_count', 'write_count',
                                      'read_bytes', 'write_bytes',
                                      'read_time', 'write_time',
@@ -287,7 +288,7 @@
 
 def cpu_stats():
     """Return various CPU stats as a named tuple."""
-    if FREEBSD:
+    if FREEBSD or MIDNIGHTBSD:
         # Note: the C ext is returning some metrics we are not exposing:
         # traps.
         ctxsw, intrs, soft_intrs, syscalls, traps = cext.cpu_stats()
@@ -407,7 +408,7 @@
 # =====================================================================
 
 
-if FREEBSD:
+if FREEBSD or MIDNIGHTBSD:
 
     def sensors_battery():
         """Return battery info."""
@@ -621,7 +622,7 @@
 
     @wrap_exceptions
     def exe(self):
-        if FREEBSD:
+        if FREEBSD or MIDNIGHTBSD:
             if self.pid == 0:
                 return ''  # else NSP
             return cext.proc_exe(self.pid)
@@ -708,7 +709,7 @@
             rawtuple[kinfo_proc_map['ch_user_time']],
             rawtuple[kinfo_proc_map['ch_sys_time']])
 
-    if FREEBSD:
+    if FREEBSD or MIDNIGHTBSD:
         @wrap_exceptions
         def cpu_num(self):
             return self.oneshot()[kinfo_proc_map['cpunum']]
@@ -867,7 +868,7 @@
 
     # --- FreeBSD only APIs
 
-    if FREEBSD:
+    if FREEBSD or MIDNIGHTBSD:
 
         @wrap_exceptions
         def cpu_affinity_get(self):
