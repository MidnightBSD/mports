--- nltk/tree/prettyprinter.py.orig	2026-03-25 20:23:28 UTC
+++ nltk/tree/prettyprinter.py
@@ -355,7 +355,7 @@ class TreePrettyPrinter:
         :param maxwidth: maximum number of characters before a label starts to
             wrap; pass None to disable.
         """
-        if abbreviate:
+        if abbreviate == True:
             abbreviate = 5
         if unicodelines:
