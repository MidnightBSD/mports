--- agent/mibgroup/mibII/udpTable.c.orig	2026-05-07 10:24:53.707621000 -0400
+++ agent/mibgroup/mibII/udpTable.c	2026-05-07 10:28:34.998663000 -0400
@@ -94,10 +94,10 @@
 #define INP_NEXT_SYMBOL		inp_queue.cqe_next	/* or set via <net-snmp/system/openbsd.h> */
 #endif
 
-#if defined(freebsd4) || defined(darwin) || defined(osf5)
+#if defined(freebsd4) || defined(darwin) || defined(osf5) || defined(__MidnightBSD_version)
 typedef struct netsnmp_inpcb_s netsnmp_inpcb;
 struct netsnmp_inpcb_s {
-#if __FreeBSD_version >= 1200026
+#if (__FreeBSD_version >= 1200026 || defined(__MidnightBSD_version))
     struct xinpcb   pcb;
 #else
     struct inpcb    pcb;
@@ -106,13 +106,18 @@
     netsnmp_inpcb  *inp_next;
 };
 #define	UDPTABLE_ENTRY_TYPE	netsnmp_inpcb 
-#define	UDPTABLE_LOCALADDRESS	pcb.inp_laddr.s_addr 
+#define	UDPTABLE_LOCALADDRESS	pcb.inp_laddr.s_addr
 #define	UDPTABLE_LOCALPORT	pcb.inp_lport
 #else
-#define	UDPTABLE_ENTRY_TYPE	struct inpcb 
-#define	UDPTABLE_LOCALADDRESS	inp_laddr.s_addr 
+#define	UDPTABLE_ENTRY_TYPE	struct inpcb
+#define	UDPTABLE_LOCALADDRESS	inp_laddr.s_addr
 #define	UDPTABLE_LOCALPORT	inp_lport
 #endif
+#ifdef __MidnightBSD_version
+/* netsnmp_inpcb_s uses inp_next, not inp_list.le_next from midnightbsd.h */
+#undef INP_NEXT_SYMBOL
+#define INP_NEXT_SYMBOL		inp_next
+#endif
 #define	UDPTABLE_IS_LINKED_LIST
 
 #endif                          /* hpux11 */
@@ -712,7 +717,7 @@
         nnew = SNMP_MALLOC_TYPEDEF(UDPTABLE_ENTRY_TYPE);
         if (!nnew)
             break;
-#if __FreeBSD_version >= 1200026
+#if (__FreeBSD_version >= 1200026 || defined(__MidnightBSD_version))
         memcpy(&nnew->pcb, xig, sizeof(struct xinpcb));
 #else
         memcpy(&nnew->pcb, &((struct xinpcb *) xig)->xi_inp, sizeof(struct inpcb));
