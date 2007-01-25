
$FreeBSD: ports/net-mgmt/net-snmp4/files/patch-agent::mibgroup::ucd_snmp.h,v 1.1 2006/07/26 01:22:10 sobomax Exp $

--- agent/mibgroup/ucd_snmp.h
+++ agent/mibgroup/ucd_snmp.h
@@ -31,7 +31,11 @@
 config_arch_require(freebsd4, ucd-snmp/vmstat_freebsd2)
 config_arch_require(freebsd4, ucd-snmp/memory_freebsd2)
 config_arch_require(freebsd5, ucd-snmp/vmstat_freebsd2)
+config_arch_require(freebsd6, ucd-snmp/vmstat_freebsd2)
+config_arch_require(freebsd7, ucd-snmp/vmstat_freebsd2)
 config_arch_require(freebsd5, ucd-snmp/memory_freebsd2)
+config_arch_require(freebsd6, ucd-snmp/memory_freebsd2)
+config_arch_require(freebsd7, ucd-snmp/memory_freebsd2)
 config_arch_require(netbsd1, ucd-snmp/vmstat_netbsd1)
 config_arch_require(netbsd1, ucd-snmp/memory_netbsd1)
 config_arch_require(openbsd2, ucd-snmp/vmstat_netbsd1)
