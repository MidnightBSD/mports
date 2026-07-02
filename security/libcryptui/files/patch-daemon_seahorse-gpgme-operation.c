--- daemon/seahorse-gpgme-operation.c.orig	2014-09-23 07:25:19 UTC
+++ daemon/seahorse-gpgme-operation.c
@@ -304,6 +304,8 @@ event_cb (void *data, gpgme_event_io_t type, void *typ
     case GPGME_EVENT_NEXT_KEY:
+#ifdef GPGME_EVENT_NEXT_TRUSTITEM
     case GPGME_EVENT_NEXT_TRUSTITEM:
+#endif
     default:
         /* Ignore unsupported event types */
         break;
