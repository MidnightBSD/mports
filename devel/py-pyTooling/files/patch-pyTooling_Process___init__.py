--- pyTooling/Process/__init__.py.orig
+++ pyTooling/Process/__init__.py
@@ -190,13 +190,10 @@
-			"""
-			Get the memory usage of this Python process on a FreeBSD system.
-
-			``resource.getrusage`` provides the resident size portably on FreeBSD.
-			Virtual memory usage is not exposed by the stdlib here, so report ``0``
-			for the virtual component until upstream adds a native implementation.
-
-			:returns: Memory usage of the current process.
-			"""
-			from resource import RUSAGE_SELF, getrusage
-
-			rss = getrusage(RUSAGE_SELF).ru_maxrss * 1024
-			return MemoryInfo(rss, 0)
+			"""Read the current process' resident and virtual memory sizes using :program:`ps`."""
+			from subprocess import CalledProcessError, check_output
+
+			try:
+				output = check_output(["/bin/ps", "-p", str(getpid()), "-o", "rss=", "-o", "vsz="], text=True)
+				rss, vms = map(int, output.split())
+			except (OSError, CalledProcessError, ValueError) as ex:
+				raise PlatformError("Failed to get current process' memory usage using /bin/ps.") from ex
+
+			return MemoryInfo(rss * 1024, vms * 1024)
