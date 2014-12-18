--- build-aux/ltmain.sh.orig	2013-10-26 18:53:58.000000000 -0400
+++ build-aux/ltmain.sh	2014-12-17 22:53:02.964009896 -0500
@@ -8598,13 +8598,13 @@
 	  #
 	  case $version_type in
 	  # correct linux to gnu/linux during the next big refactor
-	  darwin|linux|osf|windows|none)
+	  darwin|freebsd-elf|midnightbsd|linux|osf|windows|none)
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
+	freebsd-elf|midnightbsd)
+	  func_arith $current - $age
+	  major=.$func_arith_result
+	  versuffix=$major.$age.$revision
 	  ;;
 
 	irix | nonstopux)
