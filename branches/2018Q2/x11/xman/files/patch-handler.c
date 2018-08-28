From bb926ce84421b1fc9795c229ce32332b77a4b18d Mon Sep 17 00:00:00 2001
From: =?UTF-8?q?J=C3=B6rg=20Sonnenberger?= <joerg@NetBSD.org>
Date: Thu, 22 May 2014 00:15:36 +0200
Subject: Fix tautology to the intended check.

Reviewed-by: Alan Coopersmith <alan.coopersmith@oracle.com>
Signed-off-by: Thomas Klausner <wiz@NetBSD.org>

diff --git a/handler.c b/handler.c
index e61687e..87a928e 100644
--- handler.c
+++ handler.c
@@ -320,7 +320,7 @@ SaveFormattedPage(Widget w, XEvent * event, String * params,
  * If we are not active then take no action.
  */
 
-    if (man_globals->tempfile == NULL)
+    if (man_globals->tempfile[0] == '\0')
         return;
 
     switch (params[0][0]) {
-- 
cgit v0.10.2

