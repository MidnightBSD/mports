--- pyTooling/CLIAbstraction/__init__.py.orig	2026-08-20 21:49:09 UTC
+++ pyTooling/CLIAbstraction/__init__.py
@@ -228,6 +228,10 @@
 		:raises CLIAbstractionException: If the executable doesn't exist at the given path.
 		"""
 		self._platform =    system()
+		if self._platform == "MidnightBSD":
+			executableNames = getattr(self, "_executableNames", {})
+			if "MidnightBSD" not in executableNames and "FreeBSD" in executableNames:
+				self._platform = "FreeBSD"
 		self._dryRun =      dryRun
 
 		if executablePath is not None:
