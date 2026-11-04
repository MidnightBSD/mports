--- lib/os_mon/src/cpu_sup.erl.orig	2026-10-20 00:00:00 UTC
+++ lib/os_mon/src/cpu_sup.erl
@@ -152,7 +152,7 @@
     process_flag(trap_exit, true),
     process_flag(priority, low),
     {ok, 
-	#state{	os_type = os:type(), 
+	#state{	os_type = mbsd_os_type(), 
 		server = measurement_server_start()
 	}
     }.
@@ -417,7 +417,7 @@
     [{State, ValueA + ValueB} | state_list_add(RestA, RestB)].
 
 one_step_backwards(State, New, Old) ->
-    case os:type() of
+    case mbsd_os_type() of
 	{unix, linux} ->
 	    %% This should never happen! But values sometimes takes a step
 	    %% backwards on linux. We'll ignore it as long as it's only
@@ -473,7 +473,7 @@
 
 measurement_server_init() ->
     process_flag(trap_exit, true),
-    OS = os:type(),
+    OS = mbsd_os_type(),
     Server = case OS of
 	{unix, Flavor} when
 			    Flavor==sunos;
@@ -706,3 +706,10 @@
     port_command(Port, ?ping),
     4711 = port_receive_uint32(Port, 5000),
     Port.
+
+%% MidnightBSD reports {unix, midnightbsd}; it uses the FreeBSD code paths.
+mbsd_os_type() ->
+    case os:type() of
+	{unix, midnightbsd} -> {unix, freebsd};
+	OsType -> OsType
+    end.
