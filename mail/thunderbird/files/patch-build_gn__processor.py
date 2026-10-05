commit bcf74d8c7a315c4f8ef70f1a60d4ce957cebac1d
Author: Christoph Moench-Tegeder <cmt@FreeBSD.org>

    FreeBSD workings for webrtc configure (gn_processor.py)

diff --git build/gn_processor.py build/gn_processor.py
index 36cc6bdfe492..ed0fb2b7aa45 100644
--- build/gn_processor.py
+++ build/gn_processor.py
@@ -1066,17 +1066,17 @@

     vars_set = []
     for is_debug in (True, False):
-        for target_os in ("android", "ios", "linux", "mac", "openbsd", "win"):
+        for target_os in ("freebsd",):
             target_cpus = ["x64"]
-            if target_os in ("android", "ios", "linux", "mac", "win", "openbsd"):
+            if target_os in ("android", "freebsd", "linux", "mac", "win", "openbsd"):
                 target_cpus.append("arm64")
             if target_os in ("android", "linux"):
                 target_cpus.append("arm")
-            if target_os in ("android", "linux", "win"):
-                target_cpus.append("x86")
-            if target_os in ("linux", "openbsd"):
+            if target_os in ("android", "freebsd", "linux", "win"):
+                target_cpus.append("x86")
+            if target_os in ("freebsd", "linux", "openbsd"):
                 target_cpus.append("riscv64")
             if target_os == "linux":
                 target_cpus.extend(["loong64", "ppc64", "mipsel", "mips64el"])
             for target_cpu in target_cpus:
                 vars = {
