--- src/native21/org/elasticsearch/nativeaccess/jdk/JdkBsdCLibrary.java.orig	2026-10-15 00:00:00 UTC
+++ src/native21/org/elasticsearch/nativeaccess/jdk/JdkBsdCLibrary.java
@@ -0,0 +1,38 @@
+/*
+ * Copyright Elasticsearch B.V. and/or licensed to Elasticsearch B.V. under one
+ * or more contributor license agreements. Licensed under the "Elastic License
+ * 2.0", the "GNU Affero General Public License v3.0 only", and the "Server Side
+ * Public License v 1"; you may not use this file except in compliance with, at
+ * your election, the "Elastic License 2.0", the "GNU Affero General Public
+ * License v3.0 only", or the "Server Side Public License, v 1".
+ */
+
+package org.elasticsearch.nativeaccess.jdk;
+
+import org.elasticsearch.nativeaccess.lib.BsdCLibrary;
+
+import java.lang.foreign.FunctionDescriptor;
+import java.lang.invoke.MethodHandle;
+
+import static java.lang.foreign.ValueLayout.JAVA_INT;
+import static java.lang.foreign.ValueLayout.JAVA_LONG;
+import static org.elasticsearch.nativeaccess.jdk.LinkerHelper.downcallHandle;
+
+public class JdkBsdCLibrary implements BsdCLibrary {
+
+    private static final MethodHandle posix_fallocate$mh = downcallHandle(
+        "posix_fallocate",
+        FunctionDescriptor.of(JAVA_INT, JAVA_INT, JAVA_LONG, JAVA_LONG)
+    );
+
+    // https://man.freebsd.org/cgi/man.cgi?query=posix_fallocate
+    // https://github.com/freebsd/freebsd-src/blob/release/14.2.0/sys/sys/fcntl.h#L390
+    @Override
+    public int posix_fallocate(int fd, long offset, long length) {
+        try {
+            return (int) posix_fallocate$mh.invokeExact(fd, offset, length);
+        } catch (Throwable t) {
+            throw new AssertionError(t);
+        }
+    }
+}
