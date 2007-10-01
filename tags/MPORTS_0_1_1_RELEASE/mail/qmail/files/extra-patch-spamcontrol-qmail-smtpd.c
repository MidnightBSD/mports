--- qmail-smtpd.c.orig	Wed Jan 31 13:03:47 2007
+++ qmail-smtpd.c	Wed Jan 31 13:22:36 2007
@@ -129,6 +129,27 @@
   logs(s1,s2,s3,s4,s5,s6,s7);
   return;
   }
+void err_rbl(s1,s2,s3,s4,s5,s6,s7) char *s1, *s2, *s3, *s4, *s5, *s6, *s7; {
+  char *rblmatch;
+  stralloc rblmessage = {0};
+  stralloc new_s1 = {0};
+
+  rblmatch = env_get("RBLMATCH");
+
+  if (!stralloc_copys(&rblmessage,"553 sorry, your IP is listed on a RBL list ")) die_nomem(); 
+  if (!stralloc_cats(&rblmessage,rblmatch)) die_nomem(); 
+  if (!stralloc_cats(&rblmessage," (#5.7.1)\r\n")) die_nomem(); 
+  if (!stralloc_0(&rblmessage)) die_nomem(); 
+
+  if (!stralloc_copys(&new_s1, s1)) die_nomem();
+  if (!stralloc_cats(&new_s1, " ")) die_nomem();
+  if (!stralloc_cats(&new_s1, rblmatch)) die_nomem();
+  if (!stralloc_0(&new_s1)) die_nomem(); 
+
+  out(rblmessage.s); 
+  logs(new_s1.s,s2,s3,s4,s5,s6,s7);
+  return;
+  }
 void err_brcptto(s1,s2,s3,s4,s5,s6,s7) char *s1, *s2, *s3, *s4, *s5, *s6, *s7; {
   out("550 sorry, your envelope recipient is in my badrcptto list (#5.7.1)\r\n");
   logs(s1,s2,s3,s4,s5,s6,s7);
@@ -270,6 +291,8 @@
 
 char *auth;
 char *reqauth;
+char *rbl2smtpd;
+char *rblmatch;
 int smtpauth = 0;
 int seenauth = 0;
 
@@ -388,6 +411,9 @@
   if(env_get("UCSPITLS")) starttls = 1;
   if(starttls) reqttls = env_get("REQUIRETLS");
 
+  rbl2smtpd = env_get("RBL2SMTPD");
+  rblmatch = env_get("RBLMATCH");
+
 #ifdef RELAYMAILFROM
   if (!relayclient) {
     relaymailfromok = control_readfile(&relaymailfrom,"control/relaymailfrom",0);
@@ -876,6 +902,10 @@
       flagerrcpts++;
       return; 
     } 
+    if (!seenauth && rbl2smtpd && rblmatch && str_len(rblmatch) != 0) {
+      err_rbl("Reject::RBL::RBL_Listed:",protocol.s,remoteip,remotehost,helohost.s,mailfrom.s,addr.s);
+      return;
+    }
     if (tarpitcount && flagerrcpts >= tarpitcount) { 	/* Tarpitting et al. */
       err_rcpts("Reject::RCPT::Toomany_Rcptto:",protocol.s,remoteip,remotehost,helohost.s,mailfrom.s,addr.s); 
       return; 
