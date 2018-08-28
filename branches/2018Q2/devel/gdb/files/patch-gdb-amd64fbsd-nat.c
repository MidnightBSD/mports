--- gdb/amd64fbsd-nat.c.orig	2012-02-09 17:06:44.000000000 +0100
+++ gdb/amd64fbsd-nat.c	2012-08-30 10:58:55.000000000 +0200
@@ -21,11 +21,13 @@
 #include "inferior.h"
 #include "regcache.h"
 #include "target.h"
+#include "gregset.h"
 
 #include "gdb_assert.h"
 #include <signal.h>
 #include <stddef.h>
 #include <sys/types.h>
+#include <sys/procfs.h>
 #include <sys/ptrace.h>
 #include <sys/sysctl.h>
 #include <machine/reg.h>
@@ -93,6 +95,46 @@
 };
 
 
+/* Transfering the registers between GDB, inferiors and core files.  */
+
+/* Fill GDB's register array with the general-purpose register values
+   in *GREGSETP.  */
+
+void
+supply_gregset (struct regcache *regcache, const gregset_t *gregsetp)
+{
+  amd64_supply_native_gregset (regcache, gregsetp, -1);
+}
+
+/* Fill register REGNUM (if it is a general-purpose register) in
+   *GREGSETPS with the value in GDB's register array.  If REGNUM is -1,
+   do this for all registers.  */
+
+void
+fill_gregset (const struct regcache *regcache, gdb_gregset_t *gregsetp, int regnum)
+{
+  amd64_collect_native_gregset (regcache, gregsetp, regnum);
+}
+
+/* Fill GDB's register array with the floating-point register values
+   in *FPREGSETP.  */
+
+void
+supply_fpregset (struct regcache *regcache, const fpregset_t *fpregsetp)
+{
+  amd64_supply_fxsave (regcache, -1, fpregsetp);
+}
+
+/* Fill register REGNUM (if it is a floating-point register) in
+   *FPREGSETP with the value in GDB's register array.  If REGNUM is -1,
+   do this for all registers.  */
+
+void
+fill_fpregset (const struct regcache *regcache, gdb_fpregset_t *fpregsetp, int regnum)
+{
+  amd64_collect_fxsave (regcache, regnum, fpregsetp);
+}
+
 /* Support for debugging kernel virtual memory images.  */
 
 #include <sys/types.h>
