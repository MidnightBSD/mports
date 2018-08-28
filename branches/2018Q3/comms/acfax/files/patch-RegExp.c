$FreeBSD: ports/comms/acfax/files/patch-RegExp.c,v 1.1 2002/06/08 04:53:25 petef Exp $

--- RegExp.c.old	Sun Feb 10 05:33:07 2002
+++ RegExp.c	Sun Feb 10 05:33:24 2002
@@ -23,7 +23,6 @@
  */ 
 
 #include "RegExp.h"
-#include <regex.h>
 
 void RegExpCompile(regexp,fsm_ptr)
 char *regexp;
