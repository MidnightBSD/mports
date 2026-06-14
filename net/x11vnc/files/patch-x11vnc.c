--- src/x11vnc.c.orig	2019-01-05 13:22:11 UTC
+++ src/x11vnc.c
@@ -184,6 +184,10 @@ static pid_t ts_tasks[TASKMAX];
 static pid_t ts_tasks[TASKMAX];
 static int ts_taskn = -1;
 
+MUTEX(clientMutex);
+MUTEX(inputMutex);
+MUTEX(pointerMutex);
+
 int tsdo(int port, int lsock, int *conn) {
 	int csock, rsock, i, db = 1;
 	pid_t pid;
