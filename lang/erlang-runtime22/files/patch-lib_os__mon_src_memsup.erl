--- lib/os_mon/src/memsup.erl.orig	2026-10-20 00:00:00 UTC
+++ lib/os_mon/src/memsup.erl
@@ -178,7 +178,7 @@
     process_flag(trap_exit, true),
     process_flag(priority, low),
 
-    OS = os:type(),
+    OS = mbsd_os_type(),
     PortMode = case OS of
 		   {unix, darwin} -> false;
 		   {unix, freebsd} -> false;
@@ -632,7 +632,7 @@
 	    flush(reg_collection_timeout),
 	    flush(ext_collection_timeout),
 
-	    OS = os:type(),
+	    OS = mbsd_os_type(),
 	    PortMode = case OS of
 			   {unix, darwin} -> false;
 			   {unix, freebsd} -> false;
@@ -1046,3 +1046,10 @@
     after 0 ->
 	    true
     end.
+
+%% MidnightBSD reports {unix, midnightbsd}; it uses the FreeBSD code paths.
+mbsd_os_type() ->
+    case os:type() of
+	{unix, midnightbsd} -> {unix, freebsd};
+	OsType -> OsType
+    end.
