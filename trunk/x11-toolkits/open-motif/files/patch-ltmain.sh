--- ltmain.sh.orig	2009-12-02 18:09:01.000000000 +0300
+++ ltmain.sh	2011-01-16 00:51:04.000000000 +0300
@@ -2077,10 +2077,12 @@
 	fi
 
 	# Install the pseudo-library for information purposes.
+	if /usr/bin/false; then
 	func_basename "$file"
 	name="$func_basename_result"
 	instname="$dir/$name"i
 	func_show_eval "$install_prog $instname $destdir/$name" 'exit $?'
+	fi
 
 	# Maybe install the static library, too.
 	test -n "$old_library" && staticlibs="$staticlibs $dir/$old_library"
