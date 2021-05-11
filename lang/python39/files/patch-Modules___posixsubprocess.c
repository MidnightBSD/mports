--- Modules/_posixsubprocess.c.orig	2021-04-04 08:56:53.000000000 -0400
+++ Modules/_posixsubprocess.c	2021-05-10 23:49:38.526493000 -0400
@@ -46,7 +46,7 @@
 # endif
 #endif
 
-#if defined(__FreeBSD__) || (defined(__APPLE__) && defined(__MACH__)) || defined(__DragonFly__)
+#if defined(__FreeBSD__) || (defined(__APPLE__) && defined(__MACH__)) || defined(__DragonFly__) || defined(__MidnightBSD__)
 # define FD_DIR "/dev/fd"
 #else
 # define FD_DIR "/proc/self/fd"
@@ -116,7 +116,7 @@
 }
 
 
-#if defined(__FreeBSD__) || defined(__DragonFly__)
+#if defined(__FreeBSD__) || defined(__DragonFly__) || defined(__MidnightBSD__)
 /* When /dev/fd isn't mounted it is often a static directory populated
  * with 0 1 2 or entries for 0 .. 63 on FreeBSD, NetBSD, OpenBSD and DragonFlyBSD.
  * NetBSD and OpenBSD have a /proc fs available (though not necessarily
@@ -264,7 +264,7 @@
         start_fd = keep_fd + 1;
     }
     if (start_fd <= end_fd) {
-#if defined(__FreeBSD__)
+#if defined(__FreeBSD__) || defined(__MidnightBSD__)
         /* Any errors encountered while closing file descriptors are ignored */
         closefrom(start_fd);
 #else
@@ -377,7 +377,7 @@
     ++start_fd;
 #endif
 
-#if defined(__FreeBSD__) || defined(__DragonFly__)
+#if defined(__FreeBSD__) || defined(__DragonFly__) || defined(__MidnightBSD__)
     if (!_is_fdescfs_mounted_on_dev_fd())
         proc_fd_dir = NULL;
     else
