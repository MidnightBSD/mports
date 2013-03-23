--- ./url_handler.sh.orig	Tue Apr  3 15:01:31 2007
+++ ./url_handler.sh	Tue Apr  3 15:01:31 2007
@@ -1,4 +1,4 @@
-#! /bin/bash
+#! /bin/sh
 
 #   Copyright (c) 1998  Martin Schulze <joey@debian.org>
 #   Slightly modified by Luis Francisco Gonzalez <luisgh@debian.org>
@@ -28,11 +28,11 @@
 # VT: Launch in the same terminal
 
 # The lists of programs to be executed are
-https_prgs="/usr/X11R6/bin/netscape:XW /usr/bin/lynx:XT"
-http_prgs="/usr/bin/lynx:XT /usr/X11R6/bin/netscape:XW"
-mailto_prgs="/usr/bin/mutt:VT /usr/bin/elm:VT /usr/bin/pine:VT /usr/bin/mail:VT"
-gopher_prgs="/usr/bin/lynx:XT /usr/bin/gopher:XT"
-ftp_prgs="/usr/bin/lynx:XT /usr/bin/ncftp:XT"
+https_prgs="/usr/local/bin/browser3:XW /usr/local/bin/firefox:XW /usr/local/bin/lynx:XT /usr/local/bin/w3m:XT"
+http_prgs="/usr/local/bin/browser3:XW /usr/local/bin/firefox:XW /usr/local/bin/lynx:XT /usr/local/bin/w3m:XT /usr/local/bin/links:XT"
+mailto_prgs="/usr/local/bin/mutt:VT /usr/local/bin/elm:VT /usr/local/bin/pine:VT /usr/bin/mail:VT"
+gopher_prgs="/usr/local/bin/lynx:XT /usr/local/bin/gopher:XT"
+ftp_prgs="/usr/local/bin/lynx:XT /usr/local/bin/ncftp2:XT /usr/local/bin/ncftp3:XT /usr/local/bin/ncftp:XT"
 
 # Program used as an xterm (if it doesn't support -T you'll need to change
 # the command line in getprg)
@@ -42,7 +42,7 @@
 ###########################################################################
 # Change bellow this at your own risk
 ###########################################################################
-function getprg()
+getprg()
 {
     local ele tag prog
 
