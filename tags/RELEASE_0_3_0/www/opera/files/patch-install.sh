--- install.sh.orig	Thu Jun 12 17:07:59 2008
+++ install.sh	Thu Jun 12 17:08:16 2008
@@ -97,7 +97,7 @@
 
     os=`uname -s` || error 'uname'
     case $os in
-	FreeBSD|NetBSD|DragonFly) os=AnyBSD;;
+	FreeBSD|NetBSD|DragonFly|MidnightBSD) os=AnyBSD;;
 	SunOS*) os=SunOS;;
     esac
     case $os in SunOS|AnyBSD|OpenBSD) str_defaultprefix="/usr/local";; esac
