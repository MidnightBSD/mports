--- build-aux/ltmain.sh.orig	2013-10-26 18:53:58.000000000 -0400
+++ build-aux/ltmain.sh	2015-01-03 15:30:17.521382190 -0500
@@ -6871,7 +6871,7 @@
 	    # These systems don't actually have a C library (as such)
 	    test X-lc = "X$arg" && continue
 	    ;;
-	  *-*-openbsd* | *-*-freebsd* | *-*-dragonfly* | *-*-bitrig*)
+	  *-*-openbsd* | *-*-freebsd* | *-*-dragonfly* | *-*-bitrig* | *-*-midnightbsd*)
 	    # Do not include libc due to us having libc/libc_r.
 	    test X-lc = "X$arg" && continue
 	    ;;
@@ -6891,7 +6891,7 @@
 	  esac
 	elif test X-lc_r = "X$arg"; then
 	 case $host in
-	 *-*-openbsd* | *-*-freebsd* | *-*-dragonfly* | *-*-bitrig*)
+	 *-*-openbsd* | *-*-freebsd* | *-*-dragonfly* | *-*-bitrig* | *-*-midnightbsd*)
 	   # Do not include libc_r directly, use -pthread flag.
 	   continue
 	   ;;
@@ -8598,13 +8598,13 @@
 	  #
 	  case $version_type in
 	  # correct linux to gnu/linux during the next big refactor
-	  darwin|linux|osf|windows|none)
+	  darwin|freebsd-elf|midnightbsd-elf|midnightbsd|linux|osf|windows|none)
 	    func_arith $number_major + $number_minor
 	    current=$func_arith_result
 	    age=$number_minor
 	    revision=$number_revision
 	    ;;
-	  freebsd-aout|freebsd-elf|qnx|sunos)
+	  freebsd-aout|qnx|sunos)
 	    current=$number_major
 	    revision=$number_minor
 	    age=0
@@ -8689,9 +8689,10 @@
 	  versuffix=.$current.$revision
 	  ;;
 
-	freebsd-elf)
-	  major=.$current
-	  versuffix=.$current
+	freebsd-elf|midnightbsd|midnightbsd-elf)
+	  func_arith $current - $age
+	  major=.$func_arith_result
+	  versuffix=$major.$age.$revision
 	  ;;
 
 	irix | nonstopux)
@@ -8909,7 +8910,7 @@
 	  *-*-netbsd*)
 	    # Don't link with libc until the a.out ld.so is fixed.
 	    ;;
-	  *-*-openbsd* | *-*-freebsd* | *-*-dragonfly*)
+	  *-*-openbsd* | *-*-freebsd* | *-*-dragonfly* | *-*-midnightbsd*)
 	    # Do not include libc due to us having libc/libc_r.
 	    ;;
 	  *-*-sco3.2v5* | *-*-sco5v6*)
