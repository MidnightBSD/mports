--- pyTooling/CLIAbstraction/__init__.py.orig
+++ pyTooling/CLIAbstraction/__init__.py
@@ -236,0 +237,4 @@
+		if self._platform == "MidnightBSD":
+			executableNames = getattr(self, "_EXECUTABLE_NAMES", {})
+			if "MidnightBSD" not in executableNames and "FreeBSD" in executableNames:
+				self._platform = "FreeBSD"
