--- src/programs/pkcheck.c.orig	2022-06-02 11:10:36 UTC
+++ src/programs/pkcheck.c
@@ -363,6 +363,11 @@ main (int argc, char *argv[])
   local_agent_handle = NULL;
   ret = 126;
 
+  if (argc < 1)
+    {
+     exit(126);
+    }
+
   /* Disable remote file access from GIO. */
   setenv ("GIO_USE_VFS", "local", 1);
 
