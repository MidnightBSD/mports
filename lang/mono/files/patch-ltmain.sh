--- ltmain.sh.bak	2018-08-24 11:19:14.000000000 -0400
+++ ltmain.sh	2019-09-04 19:22:19.693038000 -0400
@@ -5609,7 +5609,7 @@
 	    # These systems don't actually have a C library (as such)
 	    test "X$arg" = "X-lc" && continue
 	    ;;
-	  *-*-openbsd* | *-*-freebsd* | *-*-dragonfly*)
+	  *-*-openbsd* | *-*-freebsd* | *-*-dragonfly* | *-*-midnightbsd*)
 	    # Do not include libc due to us having libc/libc_r.
 	    test "X$arg" = "X-lc" && continue
 	    ;;
@@ -5629,7 +5629,7 @@
 	  esac
 	elif test "X$arg" = "X-lc_r"; then
 	 case $host in
-	 *-*-openbsd* | *-*-freebsd* | *-*-dragonfly*)
+	 *-*-openbsd* | *-*-freebsd* | *-*-dragonfly* | *-*-midnightbsd*)
 	   # Do not include libc_r directly, use -pthread flag.
 	   continue
 	   ;;
@@ -7636,7 +7636,7 @@
 	  *-*-netbsd*)
 	    # Don't link with libc until the a.out ld.so is fixed.
 	    ;;
-	  *-*-openbsd* | *-*-freebsd* | *-*-dragonfly*)
+	  *-*-openbsd* | *-*-freebsd* | *-*-dragonfly* | *-*-midnightbsd*)
 	    # Do not include libc due to us having libc/libc_r.
 	    ;;
 	  *-*-sco3.2v5* | *-*-sco5v6*)
