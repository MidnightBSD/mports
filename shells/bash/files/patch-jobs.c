--- jobs.c.orig	2026-11-14 04:49:27 UTC
+++ jobs.c	2026-11-14 04:49:27 UTC
@@ -4785 +4785,3 @@
-      while ((terminal_pgrp = tcgetpgrp (shell_tty)) != -1)
+      /* Some systems accept TIOCGPGRP on non-terminal descriptors. */
+      terminal_pgrp = -1;
+      while (isatty (shell_tty) && (terminal_pgrp = tcgetpgrp (shell_tty)) != -1)
