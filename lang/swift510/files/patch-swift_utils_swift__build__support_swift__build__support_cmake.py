--- swift/utils/swift_build_support/swift_build_support/cmake.py.orig	2024-06-06 04:26:30 UTC
+++ swift/utils/swift_build_support/swift_build_support/cmake.py
@@ -287,7 +287,7 @@
     # CMake compared to the source and build the source if necessary.
     # Returns the path to the cmake binary.
     def check_cmake_version(self, source_root, build_root):
-        if not platform.system() in ["Linux", "FreeBSD"]:
+        if not platform.system() in ["Linux", "FreeBSD", "MidnightBSD"]:
             return
 
         cmake_source_dir = os.path.join(source_root, 'cmake')
