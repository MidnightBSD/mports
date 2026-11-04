--- gol.c.orig
+++ gol.c
@@ -71,7 +71,7 @@

 typedef struct {
   void* handle;
-  gboolean (*init)();
+  gboolean (*init)(SUBSCRIPTOR_CONTEXT*);
   gboolean (*start)();
   gboolean (*stop)();
   gboolean (*term)();
