--- sendip.c.orig	Fri May 30 20:22:09 2008
+++ sendip.c	Fri May 30 20:22:58 2008
@@ -48,7 +48,7 @@
 	ip->ihl		= (IPHDR_SIZE + optlen + 3) >> 2;
 	ip->tos		= ip_tos;
 
-#if defined OSTYPE_FREEBSD || defined OSTYPE_NETBSD || defined OSTYPE_BSDI
+#if defined OSTYPE_FREEBSD || defined OSTYPE_MIDNIGHTBSD || defined OSTYPE_NETBSD || defined OSTYPE_BSDI
 /* FreeBSD */
 /* NetBSD */
 	ip->tot_len	= packetsize;
@@ -73,7 +73,7 @@
 			htons((unsigned short) src_id);
 	}
 
-#if defined OSTYPE_FREEBSD || defined OSTYPE_NETBSD | defined OSTYPE_BSDI
+#if defined OSTYPE_FREEBSD || defined OSTYPE_MIDNIGHTBSD || defined OSTYPE_NETBSD | defined OSTYPE_BSDI
 /* FreeBSD */
 /* NetBSD */
 	ip->frag_off	|= more_fragments;
