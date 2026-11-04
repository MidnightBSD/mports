--- src/ent/org/elasticsearch/entitlement/bootstrap/HardcodedEntitlements.java.orig	2026-10-15 00:00:00 UTC
+++ src/ent/org/elasticsearch/entitlement/bootstrap/HardcodedEntitlements.java
@@ -40,6 +40,7 @@
 import static org.elasticsearch.entitlement.runtime.policy.PathLookup.BaseDir.PLUGINS;
 import static org.elasticsearch.entitlement.runtime.policy.PathLookup.BaseDir.SHARED_DATA;
 import static org.elasticsearch.entitlement.runtime.policy.PathLookup.BaseDir.SHARED_REPO;
+import static org.elasticsearch.entitlement.runtime.policy.Platform.BSD;
 import static org.elasticsearch.entitlement.runtime.policy.Platform.LINUX;
 import static org.elasticsearch.entitlement.runtime.policy.entitlements.FilesEntitlement.Mode.READ;
 import static org.elasticsearch.entitlement.runtime.policy.entitlements.FilesEntitlement.Mode.READ_WRITE;
@@ -79,7 +80,9 @@
             FilesEntitlement.FileData.ofPath(Path.of("/sys/fs/cgroup/"), READ).withPlatform(LINUX),
             // // io stats on Linux
             FilesEntitlement.FileData.ofPath(Path.of("/proc/self/mountinfo"), READ).withPlatform(LINUX),
-            FilesEntitlement.FileData.ofPath(Path.of("/proc/diskstats"), READ).withPlatform(LINUX)
+            FilesEntitlement.FileData.ofPath(Path.of("/proc/diskstats"), READ).withPlatform(LINUX),
+            // OS release on BSD.
+            FilesEntitlement.FileData.ofPath(Path.of("/etc/os-release"), READ).withPlatform(BSD)
         );
         if (pidFile != null) {
             serverModuleFileDatas.add(FilesEntitlement.FileData.ofPath(pidFile, READ_WRITE));
