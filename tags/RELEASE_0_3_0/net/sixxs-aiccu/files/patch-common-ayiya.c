--- common/ayiya.c.orig	2009-08-15 23:07:54 -0400
+++ common/ayiya.c	2009-08-15 23:08:23 -0400
@@ -129,11 +129,7 @@
 
 	/* Send it onto the network */
 	length = sizeof(s2)-sizeof(s2.payload)+length;
-#if defined(_FREEBSD) || defined(_DFBSD) || defined(_OPENBSD) || defined(_DARWIN) || defined(_NETBSD)
 	lenout = send(ayiya_socket->socket, (const char *)&s2, length, 0);
-#else
-	lenout = sendto(ayiya_socket->socket, (const char *)&s2, length, 0, (struct sockaddr *)&target, sizeof(target));
-#endif
 	if (lenout < 0)
 	{
 		ayiya_log(LOG_ERR, reader_name, NULL, 0, "Error (%d) while sending %u bytes to network: %s (%d)\n", lenout, length, strerror(errno), errno);
@@ -327,11 +323,7 @@
 
 	/* Send it onto the network */
 	n = sizeof(s)-sizeof(s.payload);
-#if defined(_FREEBSD) || defined(_DFBSD) || defined(_OPENBSD) || defined(_DARWIN) || defined(_NETBSD)
 	lenout = send(ayiya_socket->socket, (const char *)&s, (unsigned int)n, 0);
-#else
-	lenout = sendto(ayiya_socket->socket, (const char *)&s, (unsigned int)n, 0, (struct sockaddr *)&target, sizeof(target));
-#endif
 	if (lenout < 0)
 	{
 		ayiya_log(LOG_ERR, beat_name, NULL, 0, "Error (%d) while sending %u bytes sent to network: %s (%d)\n", lenout, n, strerror(errno), errno);
