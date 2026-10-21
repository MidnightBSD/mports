--- lib/os_mon/src/cpu_sup.erl.orig	2026-10-14 15:30:36 UTC
+++ lib/os_mon/src/cpu_sup.erl
@@ -320,7 +320,7 @@
     process_flag(trap_exit, true),
     process_flag(priority, low),
     {ok, 
-	#state{	os_type = os:type(), 
+	#state{	os_type = case os:type() of {unix, midnightbsd} -> {unix, freebsd}; MbsdOsType -> MbsdOsType end,
 		server = measurement_server_start()
 	}
     }.
@@ -646,7 +646,7 @@
 
 measurement_server_init() ->
     process_flag(trap_exit, true),
-    OS = os:type(),
+    OS = case os:type() of {unix, midnightbsd} -> {unix, freebsd}; MbsdOsType -> MbsdOsType end,
     Server = case OS of
 	{unix, Flavor} when
 			    Flavor==sunos;
