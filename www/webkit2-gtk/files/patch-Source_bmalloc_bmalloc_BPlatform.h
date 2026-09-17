--- Source/bmalloc/bmalloc/BPlatform.h.orig
+++ Source/bmalloc/bmalloc/BPlatform.h
@@ -380,4 +380,4 @@
 /* BENABLE(LIBPAS) is enabling libpas build. But this does not mean we use libpas for bmalloc replacement. */
 #if !defined(BENABLE_LIBPAS)
-#if BCPU(ADDRESS64) && (BOS(DARWIN) || BOS(WINDOWS) || (BOS(LINUX) && (BCPU(X86_64) || BCPU(ARM64))) || BPLATFORM(PLAYSTATION))
+#if BCPU(ADDRESS64) && (BOS(DARWIN) || BOS(WINDOWS) || (BOS(LINUX) && (BCPU(X86_64) || BCPU(ARM64))) || BOS(FREEBSD) || BPLATFORM(PLAYSTATION))
 #define BENABLE_LIBPAS 1
