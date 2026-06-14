--- agent/mibgroup/mibII/tcpTable.c.orig	2026-05-07 10:07:25.815225000 -0400
+++ agent/mibgroup/mibII/tcpTable.c	2026-05-07 10:18:48.945231000 -0400
@@ -120,7 +120,7 @@
 
 typedef struct netsnmp_inpcb_s netsnmp_inpcb;
 struct netsnmp_inpcb_s {
-#if __FreeBSD_version >= 1200026
+#if (__FreeBSD_version >= 1200026 || defined(__MidnightBSD_version))
     struct xinpcb   pcb;
 #else
     struct inpcb    pcb;
@@ -939,7 +939,7 @@
 
 #elif (defined(NETSNMP_CAN_USE_SYSCTL) && defined(TCPCTL_PCBLIST))
 
-#if defined(freebsd4) || defined(darwin)
+#if defined(freebsd4) || defined(darwin) || defined(__MidnightBSD_version)
     #define NS_ELEM struct xtcpcb
 #else
     #define NS_ELEM struct xinpcb
@@ -994,7 +994,7 @@
         nnew = SNMP_MALLOC_TYPEDEF(netsnmp_inpcb);
         if (!nnew)
             break;
-#if __FreeBSD_version >= 1200026
+#if (__FreeBSD_version >= 1200026 || defined(__MidnightBSD_version))
         nnew->state = StateMap[((NS_ELEM *) xig)->t_state];
 #else
         nnew->state = StateMap[((NS_ELEM *) xig)->xt_tp.t_state];
@@ -1003,7 +1003,7 @@
             nnew->state == 8 /*  closeWait  */ )
             tcp_estab++;
         memcpy(&(nnew->pcb), &(((NS_ELEM *) xig)->xt_inp),
-#if __FreeBSD_version >= 1200026
+#if (__FreeBSD_version >= 1200026 || defined(__MidnightBSD_version))
                            sizeof(struct xinpcb));
 #else
                            sizeof(struct inpcb));
