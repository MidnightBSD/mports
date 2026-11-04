--- tclconfig/tcl.m4.orig	2025-01-02 14:10:28.297449000 -0500
+++ tclconfig/tcl.m4	2025-01-02 14:10:47.744542000 -0500
@@ -1715,7 +1715,7 @@
 	    UNSHARED_LIB_SUFFIX='${TCL_TRIM_DOTS}.a'
 	    TCL_LIB_VERSIONS_OK=nodots
 	    ;;
-	NetBSD-*|FreeBSD-*)
+	NetBSD-*|MidnightBSD-*|FreeBSD-*)
 	    # FreeBSD 3.* and greater have ELF.
 	    # NetBSD 2.* has ELF and can use 'cc -shared' to build shared libs
 	    SHLIB_CFLAGS="-fPIC"
@@ -2175,7 +2175,7 @@
 	    AIX-*) ;;
 	    BSD/OS*) ;;
 	    IRIX*) ;;
-	    NetBSD-*|FreeBSD-*) ;;
+	    NetBSD-*|MidnightBSD-*|FreeBSD-*) ;;
 	    Darwin-*) ;;
 	    SCO_SV-3.2*) ;;
 	    *) SHLIB_CFLAGS="-fPIC" ;;
