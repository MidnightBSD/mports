--- ltmain.sh.orig	2009-05-23 10:43:50.000000000 -0400
+++ ltmain.sh	2019-02-18 11:46:24.896698000 -0500
@@ -2077,10 +2077,12 @@
 	fi
 
 	# Install the pseudo-library for information purposes.
+	if /usr/bin/false ; then
 	func_basename "$file"
 	name="$func_basename_result"
 	instname="$dir/$name"i
 	func_show_eval "$install_prog $instname $destdir/$name" 'exit $?'
+	fi
 
 	# Maybe install the static library, too.
 	test -n "$old_library" && staticlibs="$staticlibs $dir/$old_library"
@@ -4530,7 +4532,7 @@
 	    # These systems don't actually have a C library (as such)
 	    test "X$arg" = "X-lc" && continue
 	    ;;
-	  *-*-openbsd* | *-*-freebsd* | *-*-dragonfly*)
+	  *-*-openbsd* | *-*-freebsd* | *-*-dragonfly* | *-*-midnightbsd*)
 	    # Do not include libc due to us having libc/libc_r.
 	    test "X$arg" = "X-lc" && continue
 	    ;;
@@ -4550,7 +4552,7 @@
 	  esac
 	elif test "X$arg" = "X-lc_r"; then
 	 case $host in
-	 *-*-openbsd* | *-*-freebsd* | *-*-dragonfly*)
+	 *-*-openbsd* | *-*-freebsd* | *-*-dragonfly* | *-*-midnightbsd*)
 	   # Do not include libc_r directly, use -pthread flag.
 	   continue
 	   ;;
@@ -4765,7 +4767,7 @@
       # -p, -pg, --coverage, -fprofile-* pass through profiling flag for GCC
       # @file GCC response files
       -64|-mips[0-9]|-r[0-9][0-9]*|-xarch=*|-xtarget=*|+DA*|+DD*|-q*|-m*| \
-      -t[45]*|-txscale*|-p|-pg|--coverage|-fprofile-*|-F*|@*)
+      -t[45]*|-txscale*|-B*|-fstack-protector*|-fuse-ld=*|-p|-pg|--coverage|-fprofile-*|-F*|@*)
         func_quote_for_eval "$arg"
 	arg="$func_quote_for_eval_result"
         func_append compile_command " $arg"
@@ -5664,7 +5666,7 @@
 	    linklib=$newlib
 	  fi # test -n "$old_archive_from_expsyms_cmds"
 
-	  if test "$linkmode" = prog || test "$mode" != relink; then
+	  if :; then
 	    add_shlibpath=
 	    add_dir=
 	    add=
@@ -5762,7 +5764,7 @@
 	    fi
 	  fi
 
-	  if test "$linkmode" = prog || test "$mode" = relink; then
+	  if test "$linkmode" = prog ; then
 	    add_shlibpath=
 	    add_dir=
 	    add=
@@ -6192,7 +6194,7 @@
 	  # which has an extra 1 added just for fun
 	  #
 	  case $version_type in
-	  darwin|linux|osf|windows|none)
+	  darwin|midnightbsd-elf|freebsd-elf|linux|osf|windows|none)
 	    func_arith $number_major + $number_minor
 	    current=$func_arith_result
 	    age="$number_minor"
@@ -6278,8 +6280,8 @@
 	  ;;
 
 	freebsd-elf)
-	  major=".$current"
-	  versuffix=".$current"
+	  major=.$(($current - $age))
+	  versuffix="$major.$age.$revision"
 	  ;;
 
 	irix | nonstopux)
@@ -6493,7 +6495,7 @@
 	  *-*-netbsd*)
 	    # Don't link with libc until the a.out ld.so is fixed.
 	    ;;
-	  *-*-openbsd* | *-*-freebsd* | *-*-dragonfly*)
+	  *-*-openbsd* | *-*-freebsd* | *-*-dragonfly* | *-*-midnightbsd*)
 	    # Do not include libc due to us having libc/libc_r.
 	    ;;
 	  *-*-sco3.2v5* | *-*-sco5v6*)
