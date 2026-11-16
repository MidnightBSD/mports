Obtained from: https://github.com/qemu/qemu/commit/eb844330bd36ebdd4959053da08069d1e5d49119

--- docs/conf.py.orig
+++ docs/conf.py
@@ -29,7 +29,6 @@
 import os
 import sys
 import sphinx
-from distutils.version import LooseVersion
 from sphinx.errors import ConfigError

 # Make Sphinx fail cleanly if using an old Python, rather than obscurely
@@ -174,11 +173,10 @@
 # Theme options are theme-specific and customize the look and feel of a theme
 # further.  For a list of options available for each theme, see the
 # documentation.
-if LooseVersion(sphinx_rtd_theme.__version__) >= LooseVersion("0.4.3"):
-    html_theme_options = {
-        "style_nav_header_background": "#802400",
-        "navigation_with_keys": True,
-    }
+html_theme_options = {
+    "style_nav_header_background": "#802400",
+    "navigation_with_keys": True,
+}

 html_logo = os.path.join(qemu_docdir, "../ui/icons/qemu_128x128.png")

