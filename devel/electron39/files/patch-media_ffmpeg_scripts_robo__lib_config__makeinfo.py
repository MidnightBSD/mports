--- media/ffmpeg/scripts/robo_lib/config.py.orig	2025-02-03 00:00:00 UTC
+++ media/ffmpeg/scripts/robo_lib/config.py
@@ -282,6 +282,8 @@
 
     def EnsureNoMakeInfo(self):
         """Ensure that makeinfo is not available."""
+        if platform.system() == "MidnightBSD":
+            return
         if os.system("makeinfo --version > /dev/null 2>&1") == 0:
             raise errors.UserInstructions(
                 "makeinfo is available and we don't need it, so please remove "
