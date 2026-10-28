commit 70c3be521da1296f7ba47bd07b67927e43634d1b
Author: Christoph Moench-Tegeder <cmt@burggraben.net>

    disable SSE and friends in builds for legacy architectures

diff --git mozglue/misc/SSE.h mozglue/misc/SSE.h
index 0b87366a8043..af0a0b38d23c 100644
--- mozglue/misc/SSE.h
+++ mozglue/misc/SSE.h
@@ -100,36 +100,50 @@
 #    define MOZILLA_PRESUME_MMX 1
 #  endif
 #  ifdef __SSE__
+#  if !defined(__386__)
 // It's ok to use SSE instructions based on the -march option (or
 // the default for x86_64 or for Intel Mac).
 #    define MOZILLA_PRESUME_SSE 1
 #  endif
+#  endif
 #  ifdef __SSE2__
+#  if !defined(__386__)
 // It's ok to use SSE2 instructions based on the -march option (or
 // the default for x86_64 or for Intel Mac).
 #    define MOZILLA_PRESUME_SSE2 1
 #  endif
+#  endif
 #  ifdef __SSE3__
+#  if !defined(__386__)
 // It's ok to use SSE3 instructions based on the -march option (or the
 // default for Intel Mac).
 #    define MOZILLA_PRESUME_SSE3 1
 #  endif
+#  endif
 #  ifdef __SSSE3__
+#  if !defined(__386__)
 // It's ok to use SSSE3 instructions based on the -march option.
 #    define MOZILLA_PRESUME_SSSE3 1
 #  endif
+#  endif
 #  ifdef __SSE4A__
+#  if !defined(__386__)
 // It's ok to use SSE4A instructions based on the -march option.
 #    define MOZILLA_PRESUME_SSE4A 1
 #  endif
+#  endif
 #  ifdef __SSE4_1__
+#  if !defined(__386__)
 // It's ok to use SSE4.1 instructions based on the -march option.
 #    define MOZILLA_PRESUME_SSE4_1 1
 #  endif
+#  endif
 #  ifdef __SSE4_2__
+#  if !defined(__386__)
 // It's ok to use SSE4.2 instructions based on the -march option.
 #    define MOZILLA_PRESUME_SSE4_2 1
 #  endif
+#  endif
 #  ifdef __AVX__
 // It's ok to use AVX instructions based on the -march option.
 #    define MOZILLA_PRESUME_AVX 1
@@ -144,8 +158,10 @@
 #  endif
 
 #  ifdef HAVE_CPUID_H
+#  if !defined(__i386__)
 #    define MOZILLA_SSE_HAVE_CPUID_DETECTION
 #  endif
+#  endif
 
 #elif defined(_MSC_VER) && (defined(_M_IX86) || defined(_M_AMD64))
 
