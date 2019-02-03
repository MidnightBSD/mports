--- ltmain.sh.orig	2006-03-07 11:10:49.000000000 +0000
+++ ltmain.sh	2013-02-28 19:48:14.000000000 +0000
@@ -2192,6 +2192,12 @@
 	    fi
 	    newlib_search_path="$newlib_search_path "`$echo "X$deplib" | $Xsed -e 's/^-L//'`
 	    ;;
+	  *-*-freebsd*)
+	    # FreeBSD doesn't need this...
+	    ;;
+	  *-*-midnightbsd*)
+            # MidnightBSD doesn't need this.
+	    ;;
 	  *)
 	    $echo "$modename: warning: \`-L' is ignored for archives/objects" 1>&2
 	    ;;
@@ -5995,10 +6001,12 @@
 	fi
 
 	# Install the pseudo-library for information purposes.
+	if /usr/bin/false; then
 	name=`$echo "X$file" | $Xsed -e 's%^.*/%%'`
 	instname="$dir/$name"i
 	$show "$install_prog $instname $destdir/$name"
 	$run eval "$install_prog $instname $destdir/$name" || exit $?
+	fi
 
 	# Maybe install the static library, too.
 	test -n "$old_library" && staticlibs="$staticlibs $dir/$old_library"
