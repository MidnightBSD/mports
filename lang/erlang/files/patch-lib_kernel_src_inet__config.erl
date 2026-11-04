--- lib/kernel/src/inet_config.erl.orig	2026-10-20 00:00:00 UTC
+++ lib/kernel/src/inet_config.erl
@@ -151,6 +151,8 @@
     load_resolv(filename:join(Etc, ?DEFAULT_RESOLV), resolv),
     case Type of
 	freebsd ->	    %% we may have to check version (2.2.2)
+	    load_resolv(filename:join(Etc,"host.conf"), host_conf_freebsd);
+	midnightbsd ->
 	    load_resolv(filename:join(Etc,"host.conf"), host_conf_freebsd);
 	'bsd/os' ->
 	    load_resolv(filename:join(Etc,"irs.conf"), host_conf_bsdos);
