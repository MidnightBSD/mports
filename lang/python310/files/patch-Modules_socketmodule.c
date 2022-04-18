--- Modules/socketmodule.c.orig	2022-04-18 10:43:54.117231000 -0400
+++ Modules/socketmodule.c	2022-04-18 10:48:19.089966000 -0400
@@ -443,7 +443,7 @@
 
 #if (defined(HAVE_BLUETOOTH_H) || defined(HAVE_BLUETOOTH_BLUETOOTH_H)) && !defined(__NetBSD__) && !defined(__DragonFly__)
 #define USE_BLUETOOTH 1
-#if defined(__FreeBSD__)
+#if defined(__FreeBSD__) || defined(__MidnightBSD__)
 #define BTPROTO_L2CAP BLUETOOTH_PROTO_L2CAP
 #define BTPROTO_RFCOMM BLUETOOTH_PROTO_RFCOMM
 #define BTPROTO_HCI BLUETOOTH_PROTO_HCI
@@ -1416,7 +1416,7 @@
 #endif /* !(__NetBSD__ || __DragonFly__) */
         }
 
-#if !defined(__FreeBSD__)
+#if !defined(__FreeBSD__) && !defined(__MidnightBSD__)
         case BTPROTO_SCO:
         {
             struct sockaddr_sco *a = (struct sockaddr_sco *) addr;
@@ -1946,7 +1946,7 @@
             *len_ret = sizeof *addr;
             return 1;
         }
-#if !defined(__FreeBSD__)
+#if !defined(__FreeBSD__) && !defined(__MidnightBSD__)
         case BTPROTO_SCO:
         {
             const char *straddr;
@@ -2442,7 +2442,7 @@
         case BTPROTO_HCI:
             *len_ret = sizeof (struct sockaddr_hci);
             return 1;
-#if !defined(__FreeBSD__)
+#if !defined(__FreeBSD__) && !defined(__MidnightBSD__)
         case BTPROTO_SCO:
             *len_ret = sizeof (struct sockaddr_sco);
             return 1;
@@ -7332,7 +7332,7 @@
     PyModule_AddIntMacro(m, SOL_HCI);
 #if !defined(__NetBSD__) && !defined(__DragonFly__)
     PyModule_AddIntMacro(m, HCI_FILTER);
-#if !defined(__FreeBSD__)
+#if !defined(__FreeBSD__) && !defined(__MidnightBSD__)
     PyModule_AddIntMacro(m, HCI_TIME_STAMP);
     PyModule_AddIntMacro(m, HCI_DATA_DIR);
 #endif /* !__FreeBSD__ */
