--- tests/unit/activation/test_bash.py.orig
+++ tests/unit/activation/test_bash.py
@@ -255,7 +255,7 @@
     path: Final = str(tmp_path) if failure == "tools" else "/usr/bin:/bin"
     result: Final = subprocess.run(
         [
-            "/bin/bash",
+            _BASH,
             "-c",
             ("unset BASH_VERSION; " if failure == "shell" else "")
             + '. "$1"; printf "%s|%s|%s" "$?" "$PATH" "${VIRTUAL_ENV-unset}"',
@@ -465,7 +465,7 @@
 def test_bash_relocation_without_source_preserves_path(moved_bash_activate: Path, mode: str) -> None:
     result: Final = subprocess.run(
         [
-            "/bin/bash",
+            _BASH,
             "--noprofile",
             "--norc",
             "-c",
@@ -474,7 +474,7 @@
             str(moved_bash_activate),
         ]
         if mode == "eval"
-        else ["/bin/bash", "--noprofile", "--norc"],
+        else [_BASH, "--noprofile", "--norc"],
         input=None
         if mode == "eval"
         else moved_bash_activate.read_text(encoding="utf-8") + '\nprintf "%s|%s" "$PATH" "${VIRTUAL_ENV-unset}"',
@@ -493,7 +493,7 @@
     wrapper.write_text('eval "$(cat "$1")"\n', encoding="utf-8")
     result: Final = subprocess.run(
         [
-            "bash",
+            _BASH,
             "-c",
             '. "$1" "$2"; printf "%s|%s" "$PATH" "${VIRTUAL_ENV-unset}"',
             "test",
