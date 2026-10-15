--- src/ent/org/elasticsearch/entitlement/runtime/policy/FileAccessTree.java.orig	2026-10-15 00:00:00 UTC
+++ src/ent/org/elasticsearch/entitlement/runtime/policy/FileAccessTree.java
@@ -181,7 +181,7 @@
 
     private static final Logger logger = LogManager.getLogger(FileAccessTree.class);
     private static final String FILE_SEPARATOR = getDefaultFileSystem().getSeparator();
-    static final FileAccessTreeComparison DEFAULT_COMPARISON = Platform.LINUX.isCurrent()
+    static final FileAccessTreeComparison DEFAULT_COMPARISON = (Platform.LINUX.isCurrent() || Platform.BSD.isCurrent())
         ? new CaseSensitiveComparison(separatorChar())
         : new CaseInsensitiveComparison(separatorChar());
 
