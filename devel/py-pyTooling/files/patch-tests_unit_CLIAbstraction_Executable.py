--- tests/unit/CLIAbstraction/Executable.py.orig	2026-08-20 21:49:09 UTC
+++ tests/unit/CLIAbstraction/Executable.py
@@ -75,7 +75,7 @@
 		self.assertRegex(output, r"git version \d+.\d+.\d+")
 
 
-@mark.skipif(sys_platform in ("freebsd", "win32"), reason="Don't run these tests on FreeBSD and Windows.")
+@mark.skipif((sys_platform.startswith("midnightbsd") or sys_platform in ("freebsd", "win32")), reason="Don't run these tests on FreeBSD and Windows.")
 class ExplicitBinaryDirectoryOnLinux(Testcase, Helper):
 	_binaryDirectoryPath = Path("/usr/bin")
 
@@ -88,7 +88,7 @@
 		self.assertRegex(output, r"git version \d+.\d+.\d+")
 
 
-@mark.skipif(sys_platform in ("darwin", "freebsd", "linux"), reason="Don't run these tests on FreeBSD, Linux or macOS.")
+@mark.skipif((sys_platform.startswith("midnightbsd") or sys_platform in ("darwin", "freebsd", "linux")), reason="Don't run these tests on FreeBSD, Linux or macOS.")
 class ExplicitBinaryDirectoryOnWindows(Testcase, Helper):
 	_binaryDirectoryPath = Path(r"C:\Program Files\Git\cmd")
 
