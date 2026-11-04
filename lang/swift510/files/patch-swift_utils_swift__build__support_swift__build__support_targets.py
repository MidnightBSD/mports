--- swift/utils/swift_build_support/swift_build_support/targets.py.orig	2024-06-06 04:26:30 UTC
+++ swift/utils/swift_build_support/swift_build_support/targets.py
@@ -278,7 +278,7 @@
         "riscv64",
         "s390x"])
 
-    FreeBSD = Platform("freebsd", archs=["x86_64", "arm64"])
+    FreeBSD = Platform("freebsd", archs=["x86_64", "aarch64"])
 
     OpenBSD = OpenBSDPlatform("openbsd", archs=["amd64"])
 
@@ -375,11 +375,11 @@
             elif machine == 'arm64e':
                 return StdlibDeploymentTarget.OSX.arm64e
 
-        elif system == 'FreeBSD':
+        elif system == 'FreeBSD' or system == 'MidnightBSD':
             if machine == 'amd64':
                 return StdlibDeploymentTarget.FreeBSD.x86_64
             elif machine == 'arm64':
-                return StdlibDeploymentTarget.FreeBSD.arm64
+                return StdlibDeploymentTarget.FreeBSD.aarch64
 
         elif system == 'OpenBSD':
             if machine == 'amd64':
