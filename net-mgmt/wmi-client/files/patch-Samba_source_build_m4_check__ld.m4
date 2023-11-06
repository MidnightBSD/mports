--- Samba/source/build/m4/check_ld.m4.orig	2023-10-21 19:07:04 UTC
+++ Samba/source/build/m4/check_ld.m4
@@ -72,7 +72,7 @@ case "$host_os" in
 		SONAMEFLAG="-Wl,-h,"
 		PICFLAG="-KPIC"   # Is this correct for SunOS
 		;;
-	*netbsd* | *freebsd* | *dragonfly* )  
+	*netbsd* | *freebsd* | *dragonfly* | *midnightbsd*)  
 		BLDSHARED="true"
 		LDFLAGS="-Wl,--export-dynamic"
 		SONAMEFLAG="-Wl,-soname,"
