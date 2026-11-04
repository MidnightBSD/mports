--- src/native/org/elasticsearch/nativeaccess/BsdNativeAccess.java.orig	2026-10-15 00:00:00 UTC
+++ src/native/org/elasticsearch/nativeaccess/BsdNativeAccess.java
@@ -0,0 +1,69 @@
+/*
+ * Copyright Elasticsearch B.V. and/or licensed to Elasticsearch B.V. under one
+ * or more contributor license agreements. Licensed under the "Elastic License
+ * 2.0", the "GNU Affero General Public License v3.0 only", and the "Server Side
+ * Public License v 1"; you may not use this file except in compliance with, at
+ * your election, the "Elastic License 2.0", the "GNU Affero General Public
+ * License v3.0 only", or the "Server Side Public License, v 1".
+ */
+
+package org.elasticsearch.nativeaccess;
+
+import org.elasticsearch.nativeaccess.lib.BsdCLibrary;
+import org.elasticsearch.nativeaccess.lib.NativeLibraryProvider;
+import org.elasticsearch.nativeaccess.lib.PosixCLibrary;
+
+class BsdNativeAccess extends PosixNativeAccess {
+
+    private final BsdCLibrary bsdLibc;
+    static final int RLIMIT_NPROC = 7;
+
+    // MidnightBSD 4.x / FreeBSD 13+ amd64 ABI, checked against sys/stat.h
+    // and sys/resource.h: sizeof(stat)=224, st_size=112, st_blocks=120.
+    // RLIM_INFINITY is LONG_MAX on BSD, not the Linux value of -1.
+    BsdNativeAccess(NativeLibraryProvider libraryProvider) {
+        super("BSD", libraryProvider, new PosixConstants(Long.MAX_VALUE, 10, 1, 6, 512, 224, 112, 120));
+        this.bsdLibc = libraryProvider.getLibrary(BsdCLibrary.class);
+    }
+
+    // https://github.com/freebsd/freebsd-src/blob/release/14.2.0/sys/sys/resource.h#L110
+    @Override
+    protected long getMaxThreads() {
+        return getRLimit(RLIMIT_NPROC, "max number of threads");
+    }
+
+    @Override
+    protected void logMemoryLimitInstructions() {
+        logger.warn("You can allow Elasticsearch to lock large amounts of RAM by setting the following in /etc/sysctl.conf:");
+        logger.warn("security.bsd.unprivileged_mlock=1\n");
+        logger.warn("You can also run the following command to modify the value immediately:");
+        logger.warn("sysctl security.bsd.unprivileged_mlock=1\n");
+        logger.warn("When running within a Jail, it's highly advisable to set:");
+        logger.warn("enforce_statfs = 1");
+    }
+
+    @Override
+    protected boolean nativePreallocate(int fd, long currentSize, long newSize) {
+        final int rc = bsdLibc.posix_fallocate(fd, currentSize, newSize - currentSize);
+        if (rc != 0) {
+            logger.warn("posix_fallocate failed: " + libc.strerror(rc));
+            return false;
+        }
+        return true;
+    }
+
+    // https://github.com/elastic/elasticsearch/blob/v8.15.5/server/src/main/java/org/elasticsearch/bootstrap/SystemCallFilter.java#L556
+    @Override
+    public void tryInstallExecSandbox() {
+        PosixCLibrary.RLimit limit = libc.newRLimit();
+        limit.rlim_cur(0);
+        limit.rlim_max(0);
+        if (libc.setrlimit(RLIMIT_NPROC, limit) != 0) {
+            throw new UnsupportedOperationException("RLIMIT_NPROC unavailable: " + libc.strerror(libc.errno()));
+        }
+
+        logger.debug("FreeBSD RLIMIT_NPROC initialization successful");
+
+        execSandboxState = ExecSandboxState.ALL_THREADS;
+    }
+}
