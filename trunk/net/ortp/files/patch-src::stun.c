
$FreeBSD: ports/net/ortp/files/patch-src::stun.c,v 1.1 2007/04/08 18:07:23 sobomax Exp $

--- src/stun.c
+++ src/stun.c
@@ -768,7 +768,7 @@
 	read(fd,&tick,sizeof(tick));
 	closesocket(fd);
       }
-#elif defined(__linux) 
+#elif defined(__linux) || defined (__FreeBSD__) 
       {
  	fd_set fdSet;
 	int maxFd=0;
