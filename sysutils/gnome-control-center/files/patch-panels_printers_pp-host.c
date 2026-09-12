--- panels/printers/pp-host.c.orig	2026-09-11 00:00:00 UTC
+++ panels/printers/pp-host.c
@@ -259 +259 @@ _pp_host_get_snmp_devices_thread (GTask        *task,
-  argv[0] = g_strdup ("/usr/lib/cups/backend/snmp");
+  argv[0] = g_strdup ("%%PREFIX%%/libexec/cups/backend/snmp");
