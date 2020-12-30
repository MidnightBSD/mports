--- src/third_party/wiredtiger/build_posix/aclocal/ax_jni_include_dir.m4.orig	2020-12-26 20:33:33 UTC
+++ src/third_party/wiredtiger/build_posix/aclocal/ax_jni_include_dir.m4
@@ -77,6 +77,7 @@ _AS_ECHO_LOG([_JINC=$_JINC])
 case "$host_os" in
 bsdi*)          _JNI_INC_SUBDIRS="bsdos";;
 freebsd*)       _JNI_INC_SUBDIRS="freebsd";;
+midnightbsd*)       _JNI_INC_SUBDIRS="midnightbsd";;
 linux*)         _JNI_INC_SUBDIRS="linux genunix";;
 osf*)           _JNI_INC_SUBDIRS="alpha";;
 solaris*)       _JNI_INC_SUBDIRS="solaris";;
