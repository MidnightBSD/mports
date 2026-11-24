--- lib/install_oses.mk.orig	2026-11-24 15:10:35 UTC
+++ lib/install_oses.mk
@@ -14,4 +14,4 @@ UNAME := $(shell sh -c 'MSYSTEM="MSYS" uname')
 UNAME := $(shell sh -c 'MSYSTEM="MSYS" uname')
 
 # List of OSes for which target install is supported
-INSTALL_OS_LIST ?= Linux Darwin GNU/kFreeBSD GNU OpenBSD FreeBSD NetBSD DragonFly SunOS Haiku AIX MSYS_NT% CYGWIN_NT%
+INSTALL_OS_LIST ?= Linux Darwin GNU/kFreeBSD GNU OpenBSD FreeBSD MidnightBSD NetBSD DragonFly SunOS Haiku AIX MSYS_NT% CYGWIN_NT%
