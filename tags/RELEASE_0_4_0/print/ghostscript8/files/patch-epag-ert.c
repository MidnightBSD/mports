--- epag-3.09/ert.c.orig	2000-07-08 13:33:09.000000000 +0900
+++ epag/ert.c	2012-02-13 03:38:07.000000000 +0900
@@ -1,6 +1,8 @@
 /* $Id: patch-epag-ert.c,v 1.1 2012-09-08 21:15:03 laffer1 Exp $ */
 
 #include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
 
 /*
  * EPSON Remoteのコマンドを出力するコマンド
