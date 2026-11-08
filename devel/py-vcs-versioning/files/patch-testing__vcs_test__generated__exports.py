--- /dev/null	1970-01-01 00:00:00 UTC
+++ testing_vcs/test_generated_exports.py
@@ -0,0 +1,29 @@
+"""Generated version modules retain the same six exports in sorted order."""
+from __future__ import annotations
+
+import pytest
+
+from vcs_versioning import Configuration
+from vcs_versioning._dump_version import write_version_to_path
+from vcs_versioning._scm_version import meta
+
+
+@pytest.mark.parametrize("node", [None, "g1234567890abcdef"])
+def test_generated_version_exports_sorted_and_unchanged(tmp_path, node):
+    version = "1.2.3"
+    scm_version = meta(version, node=node, config=Configuration())
+    target = tmp_path / "_version.py"
+    write_version_to_path(
+        target, template=None, version=version, scm_version=scm_version
+    )
+    namespace = {}
+    exec(compile(target.read_text(encoding="utf-8"), str(target), "exec"), namespace)
+    exports = namespace["__all__"]
+    assert exports == sorted(exports)
+    assert set(exports) == {
+        "__commit_id__", "__version__", "__version_tuple__",
+        "commit_id", "version", "version_tuple",
+    }
+    assert namespace["__version__"] == namespace["version"] == version
+    assert namespace["__version_tuple__"] == namespace["version_tuple"] == (1, 2, 3)
+    assert namespace["__commit_id__"] == namespace["commit_id"] == scm_version.short_node
