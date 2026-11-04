--- Modules/_posixsubprocess.c.orig	2022-03-23 16:12:04.000000000 -0400
+++ Modules/_posixsubprocess.c	2022-04-18 10:42:48.781552000 -0400
@@ -55,7 +55,7 @@
 # endif
 #endif
 
-#if defined(__FreeBSD__) || (defined(__APPLE__) && defined(__MACH__)) || defined(__DragonFly__)
+#if defined(__FreeBSD__) || (defined(__APPLE__) && defined(__MACH__)) || defined(__DragonFly__) || defined(__MidnightBSD__)
 # define FD_DIR "/dev/fd"
 #else
 # define FD_DIR "/proc/self/fd"
@@ -86,7 +86,7 @@
 }
 
 
-#if defined(__FreeBSD__) || defined(__DragonFly__)
+#if defined(__FreeBSD__) || defined(__DragonFly__) || defined(__MidnightBSD__)
 /* When /dev/fd isn't mounted it is often a static directory populated
  * with 0 1 2 or entries for 0 .. 63 on FreeBSD, NetBSD, OpenBSD and DragonFlyBSD.
  * NetBSD and OpenBSD have a /proc fs available (though not necessarily
@@ -336,7 +336,7 @@
     ++start_fd;
 #endif
 
-#if defined(__FreeBSD__) || defined(__DragonFly__)
+#if defined(__FreeBSD__) || defined(__DragonFly__) || defined(__MidnightBSD__)
     if (!_is_fdescfs_mounted_on_dev_fd())
         proc_fd_dir = NULL;
     else
