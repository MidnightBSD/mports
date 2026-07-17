--- src/suggestion.cpp.orig
+++ src/suggestion.cpp
@@ -103 +103 @@
-  return !m_database.internal.empty();
+  return m_database.internal.get() != nullptr;
