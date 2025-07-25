--- navi2ch-vars.el.orig	2015-03-30 02:16:24 UTC
+++ navi2ch-vars.el
@@ -2009,8 +2009,8 @@ Navi2ch$B%+%F%4%j$K!VAw?.95$(!WHD$,<+F0
 
 ;; net variables
 (defcustom navi2ch-net-http-proxy
-  (if (string= (getenv "HTTP_PROXY") "")
-      nil
+  (if (string= (or (getenv "HTTP_PROXY") "") "")
+      "127.0.0.1:8080"
     (getenv "HTTP_PROXY"))
   "*HTTP $B%W%m%-%7$N(B URL$B!#(B"
   :type '(choice (string :tag "$B%W%m%-%7$r;XDj(B")
