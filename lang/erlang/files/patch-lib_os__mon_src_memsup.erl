--- lib/os_mon/src/memsup.erl.orig	2026-10-20 00:00:00 UTC
+++ lib/os_mon/src/memsup.erl
@@ -175,7 +175,7 @@
     process_flag(trap_exit, true),
     process_flag(priority, low),
 
-    OS = os:type(),
+    OS = mbsd_os_type(),
     PortMode = case OS of
 		   {unix, darwin} -> true;
 		   {unix, freebsd} -> false;
@@ -861,3 +861,10 @@
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
