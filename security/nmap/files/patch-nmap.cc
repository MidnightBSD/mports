--- nmap.cc.orig	Sat Dec 22 07:32:03 2007
+++ nmap.cc	Thu Jan 10 20:41:30 2008
@@ -99,6 +99,7 @@
 
 /* $Id: patch-nmap.cc,v 1.1 2010-12-16 04:14:56 laffer1 Exp $ */
 
+#include <getopt.h>
 #include "nmap.h"
 #include "osscan.h"
 #include "osscan2.h"
