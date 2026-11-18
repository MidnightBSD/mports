--- setup.py.orig	2026-07-08 09:16:27 UTC
+++ setup.py
@@ -196,7 +196,7 @@ if EXTRA_ENV_COMPILE_ARGS is None:
         # Reduce the optimization level from O3 (in many cases) to O1 to
         # workaround gcc misalignment bug with MOVAPS (internal b/329134877)
         EXTRA_ENV_COMPILE_ARGS += " -O1"
-    elif "darwin" in sys.platform:
+    elif "darwin" in sys.platform or "freebsd" in sys.platform or "midnightbsd" in sys.platform:
         # AppleClang by defaults uses C17 so only C++17 needs to be specified.
         EXTRA_ENV_COMPILE_ARGS += " -std=c++17"
         EXTRA_ENV_COMPILE_ARGS += " -fno-wrapv -frtti"
@@ -229,7 +229,7 @@ if EXTRA_ENV_LINK_ARGS is None:
         EXTRA_ENV_LINK_ARGS += " -Wl,-exported_symbol,_{}".format(
             _EXT_INIT_SYMBOL
         )
-    if "linux" in sys.platform or "darwin" in sys.platform:
+    if "linux" in sys.platform or "darwin" in sys.platform or "freebsd" in sys.platform or "midnightbsd" in sys.platform:
         EXTRA_ENV_LINK_ARGS += " -lpthread"
         if check_linker_need_libatomic():
             EXTRA_ENV_LINK_ARGS += " -latomic"
@@ -269,5 +269,5 @@ if "win32" in sys.platform:
     )
     if "64bit" in platform.architecture()[0]:
         DEFINE_MACROS += (("MS_WIN64", 1),)
-elif "linux" in sys.platform or "darwin" in sys.platform:
+elif "linux" in sys.platform or "darwin" in sys.platform or "freebsd" in sys.platform or "midnightbsd" in sys.platform:
     DEFINE_MACROS += (("HAVE_PTHREAD", 1),)
@@ -349,7 +349,7 @@ if __name__ == "__main__":
         install_requires=[
             "protobuf>=7.35.1,<8.0.0",
             "grpcio>={version}".format(version=grpc_version.VERSION),
-            "setuptools>=77.0.1",
+            "setuptools>=63.1.0",
         ],
         package_data=package_data(),
         cmdclass={
