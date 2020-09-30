--- build-aux/ltmain.sh.orig	2020-09-29 16:23:56 UTC
+++ build-aux/ltmain.sh
@@ -7021,7 +7021,7 @@ func_mode_link ()
 	    # These systems don't actually have a C library (as such)
 	    test X-lc = "X$arg" && continue
 	    ;;
-	  *-*-openbsd* | *-*-freebsd* | *-*-dragonfly* | *-*-bitrig*)
+	  *-*-openbsd* | *-*-freebsd* | *-*-dragonfly* | *-*-bitrig* | *-*-midnightbsd*)
 	    # Do not include libc due to us having libc/libc_r.
 	    test X-lc = "X$arg" && continue
 	    ;;
@@ -7041,7 +7041,7 @@ func_mode_link ()
 	  esac
 	elif test X-lc_r = "X$arg"; then
 	 case $host in
-	 *-*-openbsd* | *-*-freebsd* | *-*-dragonfly* | *-*-bitrig*)
+	 *-*-openbsd* | *-*-freebsd* | *-*-dragonfly* | *-*-bitrig* | *-*-midnightbsd*)
 	   # Do not include libc_r directly, use -pthread flag.
 	   continue
 	   ;;
@@ -8807,7 +8807,7 @@ func_mode_link ()
 	  #
 	  case $version_type in
 	  # correct linux to gnu/linux during the next big refactor
-	  darwin|freebsd-elf|linux|osf|windows|none)
+	  darwin|midnightbsd-elf|freebsd-elf|linux|osf|windows|none)
 	    func_arith $number_major + $number_minor
 	    current=$func_arith_result
 	    age=$number_minor
@@ -9124,7 +9124,7 @@ func_mode_link ()
 	  *-*-netbsd*)
 	    # Don't link with libc until the a.out ld.so is fixed.
 	    ;;
-	  *-*-openbsd* | *-*-freebsd* | *-*-dragonfly*)
+	  *-*-openbsd* | *-*-freebsd* | *-*-dragonfly* | *-*-midnightbsd*)
 	    # Do not include libc due to us having libc/libc_r.
 	    ;;
 	  *-*-sco3.2v5* | *-*-sco5v6*)
