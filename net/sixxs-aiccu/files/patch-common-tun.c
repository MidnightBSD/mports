--- common/tun.c.orig	2009-08-15 23:06:16 -0400
+++ common/tun.c	2009-08-15 23:06:29 -0400
@@ -752,22 +752,6 @@
 
 	tun_log(LOG_DEBUG, "start", "Using TUN/TAP interface %s\n", g_aiccu->ipv6_interface);
 
-#ifndef _FREEBSD
-#ifndef _DARWIN
-#ifndef _AIX
-	tun_log(LOG_DEBUG, "start", "Setting TUNSIFMODE for %s\n", g_aiccu->ipv6_interface);
-	if (ioctl(tun_fd, TUNSIFMODE, &mode, sizeof(mode)) == -1)
-	{
-		tun_log(LOG_ERR, "start", "Couldn't set interface %s's TUNSIFMODE to MULTICAST|POINTOPOINT: %s (%d)\n",
-			g_aiccu->ipv6_interface, strerror(errno), errno);
-		close(tun_fd);
-		tun_fd = -1;
-		return false;
-	}
-#endif
-#endif
-#endif
-
 #ifdef NEED_IFHEAD
 	tun_log(LOG_DEBUG, "start", "Setting TUNSIFHEAD for %s\n", g_aiccu->ipv6_interface);
 	mode = 1;
