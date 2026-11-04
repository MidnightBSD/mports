--- lib/os_mon/src/disksup.erl.orig	2026-10-14 15:30:36 UTC
+++ lib/os_mon/src/disksup.erl
@@ -376,7 +376,7 @@
 %%----------------------------------------------------------------------
 
 get_os(PosixOnly) ->
-    case os:type() of
+    case case os:type() of {unix, midnightbsd} -> {unix, freebsd}; MbsdOsType -> MbsdOsType end of
 	{unix, sunos} ->
             case os:version() of
 		{5,_,_} -> {unix, solaris};
