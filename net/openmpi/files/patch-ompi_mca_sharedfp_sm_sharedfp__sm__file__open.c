--- ompi/mca/sharedfp/sm/sharedfp_sm_file_open.c.orig
+++ ompi/mca/sharedfp/sm/sharedfp_sm_file_open.c
@@ -184,10 +184,10 @@
 
 #if defined (__APPLE__)
     sm_data->sem_name = (char*) malloc( sizeof(char) * 32);
-    snprintf(sm_data->sem_name,31,"OMPIO_%s",filename_basename);
+    snprintf(sm_data->sem_name,31,"/OMPIO_%s",filename_basename);
 #else
     sm_data->sem_name = (char*) malloc( sizeof(char) * 253);
-    snprintf(sm_data->sem_name,252,"OMPIO_%s",filename_basename);
+    snprintf(sm_data->sem_name,252,"/OMPIO_%s",filename_basename);
 #endif
     // We're now done with filename_basename.  Free it here so that we
     // don't have to keep freeing it in the error/return cases.
