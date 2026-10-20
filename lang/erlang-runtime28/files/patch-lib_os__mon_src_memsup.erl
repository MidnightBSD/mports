--- lib/os_mon/src/memsup.erl.orig	2026-10-14 15:30:36 UTC
+++ lib/os_mon/src/memsup.erl
@@ -396,7 +396,7 @@
     process_flag(trap_exit, true),
     process_flag(priority, low),
 
-    OS = os:type(),
+    OS = case os:type() of {unix, midnightbsd} -> {unix, freebsd}; MbsdOsType -> MbsdOsType end,
     PortMode = case OS of
 		   {unix, darwin} -> true;
 		   {unix, freebsd} -> false;
