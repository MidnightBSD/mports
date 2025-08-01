--- src/pulsecore/shm.c.orig	2024-01-12 17:22:09 UTC
+++ src/pulsecore/shm.c
@@ -105,7 +105,7 @@ static inline size_t shm_marker_size(pa_mem_type_t typ
 
 #ifdef HAVE_SHM_OPEN
 static char *segment_name(char *fn, size_t l, unsigned id) {
-    pa_snprintf(fn, l, "/pulse-shm-%u", id);
+    pa_snprintf(fn, l, "/tmp/pulse-shm-%u", id);
     return fn;
 }
 #endif
