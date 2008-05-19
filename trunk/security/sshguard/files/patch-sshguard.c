--- src/sshguard.c.orig	Mon May 19 00:32:32 2008
+++ src/sshguard.c	Mon May 19 00:33:24 2008
@@ -150,11 +150,7 @@
         report_address(attackparser_targetaddr, attackparser_targetaddrkind, attackparser_service);
     }
 
-    if (fw_fin() != FWALL_OK) sshguard_log(LOG_ERR, "Cound not finalize firewall.");
-
-    sshguard_log_fin();
-
-    return 0;
+    exit(0);
 }
 
 
