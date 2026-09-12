--- mfbt/UniquePtrExtensions.h.orig
+++ mfbt/UniquePtrExtensions.h
@@ -101 +101 @@
-#  elif defined(XP_UNIX)
+#  elif defined(XP_UNIX) || defined(__MidnightBSD__)
