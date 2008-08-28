# $FreeBSD: ports/net-mgmt/docsis/files/patch-docsis_snmp.c,v 1.3 2007/07/10 22:13:34 pav Exp $
--- src/docsis_snmp.c.orig	Wed Oct 12 07:30:20 2005
+++ src/docsis_snmp.c	Sun Jun 10 18:25:36 2007
@@ -20,6 +20,8 @@
  *  DOCSIS is a registered trademark of Cablelabs, http://www.cablelabs.com
  */
 
+#include <string.h>
+
 #include "docsis_snmp.h"
 #include "docsis_decode.h"
 
