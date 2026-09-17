--- Source/bmalloc/libpas/src/libpas/pas_monotonic_time.c.orig
+++ Source/bmalloc/libpas/src/libpas/pas_monotonic_time.c
@@ -39,1 +39,1 @@
-#if PAS_OS(LINUX) || PAS_PLATFORM(PLAYSTATION)
+#if PAS_OS(LINUX) || PAS_OS(FREEBSD) || PAS_PLATFORM(PLAYSTATION)
@@ -82,1 +82,1 @@
-#elif PAS_OS(LINUX)
+#elif PAS_OS(LINUX) || PAS_OS(FREEBSD)
