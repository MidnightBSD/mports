--- build-aux/ltmain.sh.orig	2015-02-15 11:15:12.000000000 -0500
+++ build-aux/ltmain.sh	2018-03-07 23:37:11.000000000 -0500
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
@@ -8805,13 +8805,13 @@
 	  #
 	  case $version_type in
 	  # correct linux to gnu/linux during the next big refactor
-	  darwin|freebsd-elf|linux|osf|windows|none)
+	  darwin|freebsd-elf|midnightbsd-elf|linux|osf|windows|none)
 	    func_arith $number_major + $number_minor
 	    current=$func_arith_result
 	    age=$number_minor
 	    revision=$number_revision
 	    ;;
-	  freebsd-aout|qnx|sunos)
+	  freebsd-aout|midnightbsd-aout|qnx|sunos)
 	    current=$number_major
 	    revision=$number_minor
 	    age=0
@@ -8891,12 +8891,12 @@
           esac
 	  ;;
 
-	freebsd-aout)
+	freebsd-aout | midnightbsd-aout)
 	  major=.$current
 	  versuffix=.$current.$revision
 	  ;;
 
-	freebsd-elf)
+	freebsd-elf | midnightbsd-elf | midnightbsd)
 	  func_arith $current - $age
 	  major=.$func_arith_result
 	  versuffix=$major.$age.$revision
@@ -9122,7 +9122,7 @@
 	  *-*-netbsd*)
 	    # Don't link with libc until the a.out ld.so is fixed.
 	    ;;
-	  *-*-openbsd* | *-*-freebsd* | *-*-dragonfly*)
+	  *-*-openbsd* | *-*-freebsd* | *-*-dragonfly* | *-*-midnightbsd*)
 	    # Do not include libc due to us having libc/libc_r.
 	    ;;
 	  *-*-sco3.2v5* | *-*-sco5v6*)
