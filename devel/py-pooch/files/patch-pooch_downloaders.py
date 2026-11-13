--- pooch/downloaders.py.orig	2026-01-30 19:14:27 UTC
+++ pooch/downloaders.py
@@ -247,8 +247,10 @@
             elif self.progressbar:
                 progress = self.progressbar
                 progress.total = total
+            downloaded = 0
             for chunk in content:
                 if chunk:
+                    downloaded += len(chunk)
                     output_file.write(chunk)
                     output_file.flush()
                     if self.progressbar:
@@ -261,6 +263,9 @@
             # text files that are compressed by the server when sending (gzip).
             # Binary files don't experience this.
             if self.progressbar:
+                if not total:
+                    total = downloaded
+                    progress.total = total
                 progress.reset()
                 progress.update(total)
                 progress.close()
