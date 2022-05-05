--- ltmain.sh.orig	2019-11-01 05:30:00.000000000 -0400
+++ ltmain.sh	2022-05-05 04:38:57.274839000 -0400
@@ -7019,7 +7019,7 @@
 	    # These systems don't actually have a C library (as such)
 	    test X-lc = "X$arg" && continue
 	    ;;
-	  *-*-openbsd* | *-*-freebsd* | *-*-dragonfly* | *-*-bitrig*)
+	  *-*-openbsd* | *-*-freebsd* | *-*-dragonfly* | *-*-bitrig* | *-*-midnightbsd*)
 	    # Do not include libc due to us having libc/libc_r.
 	    test X-lc = "X$arg" && continue
 	    ;;
@@ -7039,7 +7039,7 @@
 	  esac
 	elif test X-lc_r = "X$arg"; then
 	 case $host in
-	 *-*-openbsd* | *-*-freebsd* | *-*-dragonfly* | *-*-bitrig*)
+	 *-*-openbsd* | *-*-freebsd* | *-*-dragonfly* | *-*-bitrig* | *-*-midnightbsd*)
 	   # Do not include libc_r directly, use -pthread flag.
 	   continue
 	   ;;
@@ -8807,7 +8807,7 @@
 	  #
 	  case $version_type in
 	  # correct linux to gnu/linux during the next big refactor
-	  darwin|freebsd-elf|linux|osf|windows|none)
+	  darwin|midnightbsd-elf|freebsd-elf|linux|osf|windows|none)
 	    func_arith $number_major + $number_minor
 	    current=$func_arith_result
 	    age=$number_minor
@@ -8898,7 +8898,7 @@
 	  versuffix=.$current.$revision
 	  ;;
 
-	freebsd-elf)
+	midnightbsd-elf|freebsd-elf)
 	  func_arith $current - $age
 	  major=.$func_arith_result
 	  versuffix=$major.$age.$revision
@@ -9124,7 +9124,7 @@
 	  *-*-netbsd*)
 	    # Don't link with libc until the a.out ld.so is fixed.
 	    ;;
-	  *-*-openbsd* | *-*-freebsd* | *-*-dragonfly*)
+	  *-*-openbsd* | *-*-freebsd* | *-*-dragonfly* | *-*-midnightbsd*)
 	    # Do not include libc due to us having libc/libc_r.
 	    ;;
 	  *-*-sco3.2v5* | *-*-sco5v6*)
