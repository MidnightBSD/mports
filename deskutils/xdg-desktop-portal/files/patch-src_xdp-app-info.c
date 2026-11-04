--- src/xdp-app-info.c.orig
+++ src/xdp-app-info.c
@@ -577,7 +577,13 @@
         }
     }
 
-  proc_path = g_strdup_printf ("/proc/self/fd/%d", fd);
+  proc_path = g_strdup_printf (
+#if defined(__FreeBSD__) || defined(__MidnightBSD__)
+                         "/dev/fd/%d",
+#else
+                         "/proc/self/fd/%d",
+#endif
+                         fd);
 
   /* Must be able to read valid path from /proc/self/fd */
   /* This is an absolute and (at least at open time) symlink-expanded path */
