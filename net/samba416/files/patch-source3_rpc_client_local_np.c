--- source3/rpc_client/local_np.c.orig	2026-01-08 16:31:22.732698000 -0500
+++ source3/rpc_client/local_np.c	2026-01-08 16:31:42.621099000 -0500
@@ -24,6 +24,10 @@
 #include "libcli/named_pipe_auth/tstream_u32_read.h"
 #include "lib/util/tevent_unix.h"
 #include "auth/auth_util.h"
+
+#ifndef environ
+extern char **environ;
+#endif
 
 /**
  * @file local_np.c
