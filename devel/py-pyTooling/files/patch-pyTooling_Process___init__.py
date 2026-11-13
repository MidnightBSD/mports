--- pyTooling/Process/__init__.py.orig	2026-08-20 21:49:09 UTC
+++ pyTooling/Process/__init__.py
@@ -299,4 +299,17 @@
 				return MemoryInfo(processMemoryCounters.WorkingSetSize, processMemoryCounters.PagefileUsage)
 
+	elif CurrentPlatform.IsNativeFreeBSD:
+		def GetMemoryUsage(self) -> MemoryInfo:
+			"""Read the current process' resident and virtual memory sizes using :program:`ps`."""
+			from subprocess import CalledProcessError, check_output
+
+			try:
+				output = check_output(["/bin/ps", "-p", str(getpid()), "-o", "rss=", "-o", "vsz="], text=True)
+				rss, vms = map(int, output.split())
+			except (OSError, CalledProcessError, ValueError) as ex:
+				raise PlatformException("Failed to get current process' memory usage using /bin/ps.") from ex
+
+			return MemoryInfo(rss * 1024, vms * 1024)
+
 	else:
 		raise PlatformException(f"Unsupported platform: '{CurrentPlatform}'.")
