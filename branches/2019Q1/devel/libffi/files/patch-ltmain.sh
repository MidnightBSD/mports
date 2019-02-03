--- ltmain.sh.bak	2014-11-12 06:59:53.000000000 -0500
+++ ltmain.sh	2018-09-09 16:22:39.387176000 -0400
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
@@ -5852,7 +5852,7 @@
       # --sysroot=*          for sysroot support
       # -O*, -flto*, -fwhopr*, -fuse-linker-plugin GCC link-time optimization
       -64|-mips[0-9]|-r[0-9][0-9]*|-xarch=*|-xtarget=*|+DA*|+DD*|-q*|-m*| \
-      -t[45]*|-txscale*|-p|-pg|--coverage|-fprofile-*|-F*|@*|-tp=*|--sysroot=*| \
+      -t[45]*|-txscale*|-B*|-fstack-protector*|-fuse-ld=*|-p|-pg|--coverage|-fprofile-*|-F*|@*|-tp=*|--sysroot=*| \
       -O*|-flto*|-fwhopr*|-fuse-linker-plugin)
         func_quote_for_eval "$arg"
 	arg="$func_quote_for_eval_result"
@@ -6794,7 +6794,7 @@
 	    linklib=$newlib
 	  fi # test -n "$old_archive_from_expsyms_cmds"
 
-	  if test "$linkmode" = prog || test "$opt_mode" != relink; then
+	  if :; then
 	    add_shlibpath=
 	    add_dir=
 	    add=
@@ -6892,7 +6892,7 @@
 	    fi
 	  fi
 
-	  if test "$linkmode" = prog || test "$opt_mode" = relink; then
+	  if test "$linkmode" = prog ; then
 	    add_shlibpath=
 	    add_dir=
 	    add=
@@ -7331,7 +7331,7 @@
 	  #
 	  case $version_type in
 	  # correct linux to gnu/linux during the next big refactor
-	  darwin|linux|osf|windows|none)
+	  darwin|freebsd-elf|linux|osf|windows|none|midnightbsd-elf)
 	    func_arith $number_major + $number_minor
 	    current=$func_arith_result
 	    age="$number_minor"
@@ -7413,9 +7413,9 @@
 	  versuffix=".$current.$revision";
 	  ;;
 
-	freebsd-elf)
-	  major=".$current"
-	  versuffix=".$current"
+	freebsd-elf | midnightbsd-elf)
+	  major=.$(($current - $age))
+	  versuffix="$major.$age.$revision"
 	  ;;
 
 	irix | nonstopux)
@@ -7630,7 +7630,7 @@
 	  *-*-netbsd*)
 	    # Don't link with libc until the a.out ld.so is fixed.
 	    ;;
-	  *-*-openbsd* | *-*-freebsd* | *-*-dragonfly*)
+	  *-*-openbsd* | *-*-freebsd* | *-*-dragonfly* | *-*-midnightbsd*)
 	    # Do not include libc due to us having libc/libc_r.
 	    ;;
 	  *-*-sco3.2v5* | *-*-sco5v6*)
