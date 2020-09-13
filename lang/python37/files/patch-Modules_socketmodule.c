--- Modules/socketmodule.c.orig	2020-06-27 17:31:45.571823000 -0400
+++ Modules/socketmodule.c	2020-06-27 17:33:13.616085000 -0400
@@ -450,7 +450,7 @@
 
 #if (defined(HAVE_BLUETOOTH_H) || defined(HAVE_BLUETOOTH_BLUETOOTH_H)) && !defined(__NetBSD__) && !defined(__DragonFly__)
 #define USE_BLUETOOTH 1
-#if defined(__FreeBSD__)
+#if defined(__FreeBSD__) || defined(__MidnightBSD__)
 #define BTPROTO_L2CAP BLUETOOTH_PROTO_L2CAP
 #define BTPROTO_RFCOMM BLUETOOTH_PROTO_RFCOMM
 #define BTPROTO_HCI BLUETOOTH_PROTO_HCI
@@ -1382,7 +1382,7 @@
 #endif /* !(__NetBSD__ || __DragonFly__) */
         }
 
-#if !defined(__FreeBSD__)
+#if !defined(__FreeBSD__) && !defined(__MidnightBSD__)
         case BTPROTO_SCO:
         {
             struct sockaddr_sco *a = (struct sockaddr_sco *) addr;
@@ -1864,7 +1864,7 @@
             *len_ret = sizeof *addr;
             return 1;
         }
-#if !defined(__FreeBSD__)
+#if !defined(__FreeBSD__) && !defined(__MidnightBSD__)
         case BTPROTO_SCO:
         {
             struct sockaddr_sco *addr;
@@ -2275,7 +2275,7 @@
         case BTPROTO_HCI:
             *len_ret = sizeof (struct sockaddr_hci);
             return 1;
-#if !defined(__FreeBSD__)
+#if !defined(__FreeBSD__) && !defined(__MidnightBSD__)
         case BTPROTO_SCO:
             *len_ret = sizeof (struct sockaddr_sco);
             return 1;
@@ -7025,7 +7025,7 @@
 #if !defined(__NetBSD__) && !defined(__DragonFly__)
     PyModule_AddIntMacro(m, HCI_FILTER);
 #endif
-#if !defined(__FreeBSD__)
+#if !defined(__FreeBSD__) && !defined(__MidnightBSD__)
 #if !defined(__NetBSD__) && !defined(__DragonFly__)
     PyModule_AddIntMacro(m, HCI_TIME_STAMP);
 #endif
