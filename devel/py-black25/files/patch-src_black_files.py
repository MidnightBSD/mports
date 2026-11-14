--- src/black/files.py.orig	2020-02-02 00:00:00 UTC
+++ src/black/files.py	2026-11-14 06:59:50 UTC
@@ -14 +14,2 @@
-from pathspec.patterns.gitwildmatch import GitWildMatchPatternError
+from pathspec.patterns.gitignore import GitIgnorePatternError
+from pathspec.patterns.gitignore.spec import GitIgnoreSpecPattern
@@ -249,2 +250,2 @@
-        return PathSpec.from_lines("gitwildmatch", lines)
-    except GitWildMatchPatternError as e:
+        return PathSpec.from_lines(GitIgnoreSpecPattern, lines)
+    except GitIgnorePatternError as e:
