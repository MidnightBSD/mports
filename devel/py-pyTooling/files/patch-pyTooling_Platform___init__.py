--- pyTooling/Platform/__init__.py.orig	2026-08-20 21:49:09 UTC
+++ pyTooling/Platform/__init__.py
@@ -303,9 +303,11 @@
 				else:  # pragma: no cover
 					raise UnknownPlatformException(f"Unknown architecture '{machine}' for Cygwin on Windows.")
 
-			elif sys_platform.startswith("freebsd"):
+			elif sys_platform.startswith(("freebsd", "midnightbsd")):
 				if machine == "amd64":
-					self._platform = Platforms.FreeBSD
+					self._platform |= Platforms.FreeBSD | Platforms.ARCH_x86_64
+				elif machine in ("i386", "i486", "i586", "i686"):
+					self._platform |= Platforms.FreeBSD | Platforms.ARCH_x86_32
 				else:  # pragma: no cover
 					raise UnknownPlatformException(f"Unknown architecture '{machine}' for a native FreeBSD.")
