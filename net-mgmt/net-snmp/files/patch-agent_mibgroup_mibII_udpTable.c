--- agent/mibgroup/mibII/udpTable.c.orig
+++ agent/mibgroup/mibII/udpTable.c
@@ -94,10 +94,10 @@ static void udpTable_free(netsnmp_cache *cache, void *magic);
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
@@ -119,3 +119,8 @@
 #endif
+#ifdef __MidnightBSD_version
+/* netsnmp_inpcb_s uses inp_next, not inp_list.le_next from midnightbsd.h */
+#undef INP_NEXT_SYMBOL
+#define INP_NEXT_SYMBOL		inp_next
+#endif
 #define	UDPTABLE_IS_LINKED_LIST
 
@@ -728,7 +733,7 @@
         nnew = SNMP_MALLOC_TYPEDEF(UDPTABLE_ENTRY_TYPE);
         if (!nnew)
             break;
-#if __FreeBSD_version >= 1200026
+#if (__FreeBSD_version >= 1200026 || defined(__MidnightBSD_version))
         memcpy(&nnew->pcb, xig, sizeof(struct xinpcb));
 #else
         memcpy(&nnew->pcb, &((struct xinpcb *) xig)->xi_inp, sizeof(struct inpcb));
