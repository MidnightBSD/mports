--- src/programs/pkexec.c.orig	2022-06-02 11:10:42 UTC
+++ src/programs/pkexec.c
@@ -488,6 +488,15 @@ main (int argc, char *argv[])
   pid_t pid_of_caller;
   gpointer local_agent_handle;
 
+
+  /*
+   * If 'pkexec' is called THIS wrong, someone's probably evil-doing. Don't be nice, just bail out.
+   */
+  if (argc<1)
+    {
+      exit(127);
+    }
+
   ret = 127;
   authority = NULL;
   subject = NULL;
@@ -636,7 +645,15 @@ main (int argc, char *argv[])
           goto out;
         }
       g_free (path);
-      argv[n] = path = s;
+path = s;
+
+      /* argc<2 and pkexec runs just shell, argv is guaranteed to be null-terminated.
+       * /-less shell shouldn't happen, but let's be defensive and don't write to null-termination
+       */
+      if (argv[n] != NULL)
+      {
+        argv[n] = path;
+      }
     }
   if (access (path, F_OK) != 0)
     {
