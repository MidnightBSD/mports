--- tests/unit/CLIAbstraction/Program.py.orig	2026-08-20 21:49:09 UTC
+++ tests/unit/CLIAbstraction/Program.py
@@ -120,7 +120,7 @@
 			_ = Git(executablePath=self._binaryDirectoryPath / "gitt")
 
 
-@mark.skipif(sys_platform in ("freebsd", "win32"), reason="Don't run these tests on FreeBSD and Windows.")
+@mark.skipif((sys_platform.startswith("midnightbsd") or sys_platform in ("freebsd", "win32")), reason="Don't run these tests on FreeBSD and Windows.")
 class ExplicitPathsOnLinux(Testcase, Helper):
 	_binaryDirectoryPath = Path("/usr/bin")
 
@@ -159,7 +159,7 @@
 			_ = Git(executablePath=self._binaryDirectoryPath / "gitt")
 
 
-@mark.skipif(sys_platform in ("darwin", "freebsd", "linux"), reason="Don't run these tests on FreeBSD, Linux or macOS.")
+@mark.skipif((sys_platform.startswith("midnightbsd") or sys_platform in ("darwin", "freebsd", "linux")), reason="Don't run these tests on FreeBSD, Linux or macOS.")
 class ExplicitPathsOnWindows(Testcase, Helper):
 	_binaryDirectoryPath = Path(r"C:\Program Files\Git\cmd")
 
