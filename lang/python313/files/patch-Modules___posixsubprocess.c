--- Modules/_posixsubprocess.c.orig	2026-10-21 13:48:20 UTC
+++ Modules/_posixsubprocess.c
@@ -61,7 +61,7 @@
 # endif
 #endif
 
-#if defined(__FreeBSD__) || (defined(__APPLE__) && defined(__MACH__)) || defined(__DragonFly__)
+#if defined(__FreeBSD__) || (defined(__APPLE__) && defined(__MACH__)) || defined(__DragonFly__) || defined(__MidnightBSD__)
 # define FD_DIR "/dev/fd"
 #else
 # define FD_DIR "/proc/self/fd"
@@ -115,7 +115,7 @@ _pos_int_from_ascii(const char *name)
 }
 
 
-#if defined(__FreeBSD__) || defined(__DragonFly__)
+#if defined(__FreeBSD__) || defined(__DragonFly__) || defined(__MidnightBSD__)
 /* When /dev/fd isn't mounted it is often a static directory populated
  * with 0 1 2 or entries for 0 .. 63 on FreeBSD, NetBSD, OpenBSD and DragonFlyBSD.
  * NetBSD and OpenBSD have a /proc fs available (though not necessarily
@@ -507,7 +507,7 @@ _close_open_fds_maybe_unsafe(int start_fd, int *fds_to
     ++start_fd;
 #endif
 
-#if defined(__FreeBSD__) || defined(__DragonFly__)
+#if defined(__FreeBSD__) || defined(__DragonFly__) || defined(__MidnightBSD__)
     if (!_is_fdescfs_mounted_on_dev_fd())
         proc_fd_dir = NULL;
     else
