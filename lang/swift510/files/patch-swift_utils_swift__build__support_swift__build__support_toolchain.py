--- swift/utils/swift_build_support/swift_build_support/toolchain.py.orig	2024-06-06 04:26:30 UTC
+++ swift/utils/swift_build_support/swift_build_support/toolchain.py
@@ -158,8 +158,11 @@
     def __init__(self):
         # For testing toolchain initializer on non-FreeBSD systems
         sys = platform.system()
-        if sys != 'FreeBSD':
+        if sys == 'MidnightBSD':
+            # MidnightBSD ships a recent clang in the base system.
             suffixes = ['']
+        elif sys != 'FreeBSD':
+            suffixes = ['']
         # See: https://github.com/apple/swift/pull/169
         # Building Swift from source requires a recent version of the Clang
         # compiler with C++14 support.
@@ -213,7 +216,7 @@
         return MacOSX(kwargs.pop('xcrun_toolchain', 'default'))
     elif sys == 'Linux':
         return Linux()
-    elif sys == 'FreeBSD':
+    elif sys == 'FreeBSD' or sys == 'MidnightBSD':
         return FreeBSD()
     elif sys == 'OpenBSD':
         return OpenBSD()
