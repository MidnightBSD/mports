--- Tools/jit/_targets.py.orig	2026-10-21 13:48:20 UTC
+++ Tools/jit/_targets.py
@@ -539,6 +539,9 @@ def get_target(host: str) -> _COFF | _ELF | _MachO:
     elif re.fullmatch(r"x86_64-.*-linux-gnu", host):
         args = ["-fpic"]
         target = _ELF(host, args=args, ghccc=True)
+    elif re.fullmatch(r"amd64-.*-midnightbsd.*", host):
+        args = ["-fpic"]
+        target = _ELF(host, args=args, ghccc=True)
     else:
         raise ValueError(host)
     return target
