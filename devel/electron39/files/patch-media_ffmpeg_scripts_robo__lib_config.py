--- media/ffmpeg/scripts/robo_lib/config.py.orig	2025-02-03 00:00:00 UTC
+++ media/ffmpeg/scripts/robo_lib/config.py
@@ -188,8 +188,8 @@
         if re.match(r"i.86", platform.machine()):
             self._host_architecture = "ia32"
-        elif platform.machine() == "x86_64" or platform.machine() == "AMD64":
+        elif platform.machine() == "x86_64" or platform.machine() == "AMD64" or platform.machine() == "amd64":
             self._host_architecture = "x64"
-        elif platform.machine() == "aarch64":
+        elif platform.machine() == "aarch64" or platform.machine() == "arm64":
             self._host_architecture = "arm64"
         elif platform.machine() == "mips32":
             self._host_architecture = "mipsel"
@@ -228,5 +228,7 @@
         elif platform.system() == "Windows" or "CYGWIN_NT" in platform.system(
         ):
             self._host_operating_system = "win"
+        elif platform.system() == "MidnightBSD":
+            self._host_operating_system = "freebsd"
         else:
             raise ValueError(f"Unsupported platform: {platform.system()}")
@@ -273,3 +275,5 @@
         llvm_path = os.path.join(self.chrome_src(), "third_party",
                                  "llvm-build", "Release+Asserts", "bin")
+        if platform.system() == "MidnightBSD":
+            return
         if self.llvm_path() not in os.environ["PATH"]:
