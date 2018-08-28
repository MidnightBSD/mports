--- ars.c.orig	Fri May 30 20:20:58 2008
+++ ars.c	Fri May 30 20:21:36 2008
@@ -830,7 +830,7 @@
 		return -ARS_INVALID;
 	}
 	ip = (struct ars_iphdr*) packet;
-#if defined OSTYPE_FREEBSD || defined OSTYPE_NETBSD || defined OSTYPE_BSDI
+#if defined OSTYPE_FREEBSD || defined OSTYPE_MIDNIGHTBSD || defined OSTYPE_NETBSD || defined OSTYPE_BSDI
 	ip->tot_len = ntohs(ip->tot_len);
 	ip->frag_off = ntohs(ip->frag_off);
 #endif
