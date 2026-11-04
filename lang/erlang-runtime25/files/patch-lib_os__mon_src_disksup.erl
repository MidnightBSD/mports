--- lib/os_mon/src/disksup.erl.orig	2026-10-20 00:00:00 UTC
+++ lib/os_mon/src/disksup.erl
@@ -207,7 +207,7 @@
 %%----------------------------------------------------------------------
 
 get_os(PosixOnly) ->
-    case os:type() of
+    case mbsd_os_type() of
 	{unix, sunos} ->
             case os:version() of
 		{5,_,_} -> {unix, solaris};
@@ -501,3 +501,10 @@
     T;
 skip_to_eol([_ | T]) ->
     skip_to_eol(T).
+
+%% MidnightBSD reports {unix, midnightbsd}; it uses the FreeBSD code paths.
+mbsd_os_type() ->
+    case os:type() of
+	{unix, midnightbsd} -> {unix, freebsd};
+	OsType -> OsType
+    end.
