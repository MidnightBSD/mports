--- src/default.c.orig	2023-06-03 15:18:36 UTC
+++ src/default.c
@@ -542,7 +542,7 @@ static const char *default_variables[] =
     "CXX", "gcc",
 #  endif /* __MSDOS__ */
 # else
-    "CXX", "g++",
+    "CXX", "c++",
 # endif
 #endif
     /* This expands to $(CO) $(COFLAGS) $< $@ if $@ does not exist,
