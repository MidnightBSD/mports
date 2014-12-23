--- ntpd/ntp_io.c.orig	2014-12-19 03:56:55.000000000 -0800
+++ ntpd/ntp_io.c	2014-12-21 22:36:02.977441698 -0800
@@ -3454,15 +3454,15 @@
 	if (AF_INET6 == itf->family) {
 		DPRINTF(1, ("Got an IPv6 packet, from <%s> (%d) to <%s> (%d)\n",
 			stoa(&rb->recv_srcadr),
-			IN6_IS_ADDR_LOOPBACK(&rb->recv_srcadr),
+			IN6_IS_ADDR_LOOPBACK(&rb->recv_srcadr.sa6.sin6_addr),
 			stoa(&itf->sin),
-			!IN6_IS_ADDR_LOOPBACK(&itf->sin)
+			!IN6_IS_ADDR_LOOPBACK(&itf->sin.sa6.sin6_addr)
 			));
 	}
 
 	if (   AF_INET6 == itf->family
-	    && IN6_IS_ADDR_LOOPBACK(&rb->recv_srcadr)
-	    && !IN6_IS_ADDR_LOOPBACK(&itf->sin)
+	    && IN6_IS_ADDR_LOOPBACK(&rb->recv_srcadr.sa6.sin6_addr)
+	    && !IN6_IS_ADDR_LOOPBACK(&itf->sin.sa6.sin6_addr)
 	   ) {
 		packets_dropped++;
 		DPRINTF(1, ("DROPPING that packet\n"));
