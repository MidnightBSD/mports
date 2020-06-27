--- ltmain.sh.bak	2011-11-02 11:11:43.000000000 -0400
+++ ltmain.sh	2020-06-27 12:39:19.116907000 -0400
@@ -5597,7 +5597,7 @@
 	    # These systems don't actually have a C library (as such)
 	    test "X$arg" = "X-lc" && continue
 	    ;;
-	  *-*-openbsd* | *-*-freebsd* | *-*-dragonfly*)
+	  *-*-openbsd* | *-*-freebsd* | *-*-dragonfly* | *-*-midnightbsd*)
 	    # Do not include libc due to us having libc/libc_r.
 	    test "X$arg" = "X-lc" && continue
 	    ;;
@@ -5617,7 +5617,7 @@
 	  esac
 	elif test "X$arg" = "X-lc_r"; then
 	 case $host in
-	 *-*-openbsd* | *-*-freebsd* | *-*-dragonfly*)
+	 *-*-openbsd* | *-*-freebsd* | *-*-dragonfly* | *-*-midnightbsd*)
 	   # Do not include libc_r directly, use -pthread flag.
 	   continue
 	   ;;
@@ -5840,7 +5840,7 @@
       # --sysroot=*          for sysroot support
       # -O*, -flto*, -fwhopr*, -fuse-linker-plugin GCC link-time optimization
       -64|-mips[0-9]|-r[0-9][0-9]*|-xarch=*|-xtarget=*|+DA*|+DD*|-q*|-m*| \
-      -t[45]*|-txscale*|-p|-pg|--coverage|-fprofile-*|-F*|@*|-tp=*|--sysroot=*| \
+      -t[45]*|-txscale*|-B*|-fstack-protector*|-fuse-ld=*|-p|-pg|--coverage|-fprofile-*|-F*|@*|-tp=*|--sysroot=*| \
       -O*|-flto*|-fwhopr*|-fuse-linker-plugin)
         func_quote_for_eval "$arg"
 	arg="$func_quote_for_eval_result"
@@ -6782,7 +6782,7 @@
 	    linklib=$newlib
 	  fi # test -n "$old_archive_from_expsyms_cmds"
 
-	  if test "$linkmode" = prog || test "$opt_mode" != relink; then
+	  if :; then
 	    add_shlibpath=
 	    add_dir=
 	    add=
@@ -6880,7 +6880,7 @@
 	    fi
 	  fi
 
-	  if test "$linkmode" = prog || test "$opt_mode" = relink; then
+	  if test "$linkmode" = prog ; then
 	    add_shlibpath=
 	    add_dir=
 	    add=
@@ -7318,7 +7318,7 @@
 	  # which has an extra 1 added just for fun
 	  #
 	  case $version_type in
-	  darwin|linux|osf|windows|none)
+	  darwin|freebsd-elf|linux|osf|windows|none)
 	    func_arith $number_major + $number_minor
 	    current=$func_arith_result
 	    age="$number_minor"
@@ -7401,8 +7401,8 @@
 	  ;;
 
 	freebsd-elf)
-	  major=".$current"
-	  versuffix=".$current"
+	  major=.$(($current - $age))
+	  versuffix="$major.$age.$revision"
 	  ;;
 
 	irix | nonstopux)
@@ -7617,7 +7617,7 @@
 	  *-*-netbsd*)
 	    # Don't link with libc until the a.out ld.so is fixed.
 	    ;;
-	  *-*-openbsd* | *-*-freebsd* | *-*-dragonfly*)
+	  *-*-openbsd* | *-*-freebsd* | *-*-dragonfly* | *-*-midnightbsd*)
 	    # Do not include libc due to us having libc/libc_r.
 	    ;;
 	  *-*-sco3.2v5* | *-*-sco5v6*)
