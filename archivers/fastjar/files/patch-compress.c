--- compress.c.orig	2008-10-15 17:25:36 UTC
+++ compress.c
@@ -87,0 +88,4 @@
+	}
+      else if (!next && here + len >= end_of_entries)
+	{
+	  end_of_entries = here + len;
