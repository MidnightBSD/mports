--- ldap-nss.c.orig	Sat May 27 16:23:40 2006
+++ ldap-nss.c	Sat May 27 16:23:52 2006
@@ -69,7 +69,7 @@
 #endif
 
 /* Try to handle systems with both SASL libraries installed */
-#if defined(HAVE_SASL_SASL_H) && defined(HAVE_SASL_AUXPROP_REQUEST)
+#if defined(HAVE_SASL_SASL_H) 
 #include <sasl/sasl.h>
 #elif defined(HAVE_SASL_H)
 #include <sasl.h>
