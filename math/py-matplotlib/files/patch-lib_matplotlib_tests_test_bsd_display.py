--- /dev/null
+++ lib/matplotlib/tests/test_bsd_display.py
@@ -0,0 +1,26 @@
+import os
+import subprocess
+import sys
+
+import pytest
+
+
+@pytest.mark.skipif(
+    not sys.platform.startswith(("linux", "freebsd", "midnightbsd")),
+    reason="X11/Wayland availability probes are platform-specific",
+)
+@pytest.mark.parametrize("display", [None, ":99999"])
+def test_headless_display_probe(display):
+    env = os.environ.copy()
+    env.pop("DISPLAY", None)
+    env.pop("WAYLAND_DISPLAY", None)
+    if display is not None:
+        env["DISPLAY"] = display
+    proc = subprocess.run(
+        [sys.executable, "-c",
+         "from matplotlib import _c_internal_utils as c; "
+         "assert not c.xdisplay_is_valid(); "
+         "assert not c.display_is_valid()"],
+        env=env, capture_output=True, text=True,
+    )
+    assert proc.returncode == 0, proc.stderr
