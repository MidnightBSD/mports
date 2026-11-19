--- pyTooling/Platform/__init__.py.orig
+++ pyTooling/Platform/__init__.py
@@ -379 +379 @@
-			elif sys_platform.startswith("freebsd"):
+			elif sys_platform.startswith(("freebsd", "midnightbsd")):
@@ -382,0 +383,2 @@
+				elif machine in ("i386", "i486", "i586", "i686"):
+					self._platform |= Platforms.ARCH_x86_32
