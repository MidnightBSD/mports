--- jartool.c.orig	2025-02-09 11:28:36 UTC
+++ jartool.c
@@ -792,0 +793 @@
+      ze->filename[len] = '\0';
@@ -1260 +1261 @@
-  if (1 == write(jfd, fname, file_name_length))
+  if (-1 == write(jfd, fname, file_name_length))
@@ -1276 +1277 @@
-    if (existing && existing->next_entry)
+    if (existing)
@@ -1278 +1279 @@
-	if (ze->usize > existing->usize)
+	if (existing->next_entry)
@@ -1280,2 +1281 @@
-	    if (shift_down (jfd, existing->next_entry->offset,
-			    ze->usize - existing->usize, existing->next_entry))
+	    if (ze->usize > existing->usize)
@@ -1283,2 +1283,6 @@
-		fprintf (stderr, "%s: %s\n", progname, strerror (errno));
-		return 1;
+		if (shift_down (jfd, existing->next_entry->offset,
+				ze->usize - existing->usize, existing->next_entry))
+		  {
+		    fprintf (stderr, "%s: %s\n", progname, strerror (errno));
+		    return 1;
+		  }
@@ -1733 +1737,11 @@
-      tmp_buff = malloc(sizeof(char) * strlen((const char *)filename));
+      if(*filename == '/'){
+	fprintf(stderr, "Absolute path names are not allowed.\n");
+	exit(EXIT_FAILURE);
+      }
+
+      tmp_buff = malloc(strlen((const char *)filename));
+
+      if(tmp_buff == NULL) {
+	fprintf(stderr, "Out of memory.\n");
+	exit(EXIT_FAILURE);
+      }
@@ -1740,0 +1755 @@
+	  tmp_buff[idx - filename] = '/';
@@ -1744,4 +1759,3 @@
-        start = idx + 1;
-
-        strncpy(tmp_buff, (const char *)filename, (idx - filename));
-        tmp_buff[(idx - filename)] = '\0';
+
+	memcpy(tmp_buff + (start - filename), (const char *)start, (idx - start));
+	tmp_buff[idx - filename] = '\0';
@@ -1752 +1766 @@
-	if(strcmp(tmp_buff, "..") == 0){
+	if(idx - start == 2 && memcmp(start, "..", 2) == 0){
@@ -1758 +1772 @@
-	} else if (strcmp(tmp_buff, ".") != 0)
+	} else if (idx - start != 1 || *start != '.')
@@ -1759,0 +1774,3 @@
+
+        start = idx + 1;
+
@@ -1767,0 +1785 @@
+	  tmp_buff[idx - filename] = '/';
@@ -1783,0 +1802 @@
+	tmp_buff[idx - filename] = '/';
@@ -1787 +1806 @@
-      if(strlen((const char *)start) == 0)
+      if(*start == '\0')
@@ -1795 +1814 @@
-      if(strlen((const char *)start) == 0)
+      if(*start == '\0')
@@ -1879 +1898,2 @@
-    close(f_fd);
+    if (f_fd != -1)
+      close(f_fd);
