--- hints/midnightbsd.sh.orig	2013-02-16 18:09:44.000000000 +0000
+++ hints/midnightbsd.sh	2013-02-16 18:39:08.000000000 +0000
@@ -33,12 +33,8 @@
 cat > UU/usethreads.cbu <<'EOCBU'
 case "$usethreads" in
 $define|true|[yY]*)
-        lc_r=`/sbin/ldconfig -r|grep ':-lc_r'|awk '{print $NF}'|sed -n '$p'`
-	    	ldflags="-pthread $ldflags"
-	      d_gethostbyaddr_r="undef"
-	      d_gethostbyaddr_r_proto="0"
-
-	set `echo X "$libswanted "| sed -e 's/ c / c_r /'`
+	ldflags="-pthread $ldflags"
+	set `echo X "$libswanted "| sed -e 's/ c //'`
 	shift
 	libswanted="$*"
 	# Configure will probably pick the wrong libc to use for nm scan.
