--- skbuild/platform_specifics/bsd.py.orig	2020-02-02 00:00:00 UTC
+++ skbuild/platform_specifics/bsd.py
@@ -1,6 +1,8 @@
 """This module defines object specific to BSD platform."""
 
 from __future__ import annotations
+
+import textwrap
 
 from . import unix
 
@@ -8,3 +10,21 @@
 # pylint:disable=abstract-method
 class BSDPlatform(unix.UnixPlatform):
     """BSD implementation of :class:`.abstract.CMakePlatform`."""
+
+
+class MidnightBSDPlatform(BSDPlatform):
+    """MidnightBSD implementation of :class:`.abstract.CMakePlatform`."""
+
+    @property
+    def generator_installation_help(self) -> str:
+        """Return message guiding the user for installing a valid toolchain."""
+        return textwrap.dedent(
+            """\
+            Building on MidnightBSD requires a working C compiler and make, which are provided by the base system.
+            CMake must be installed separately. To use the Ninja generator, install Ninja with:
+
+              mport install ninja
+
+            Otherwise, use the Unix Makefiles generator with make.
+            """
+        ).strip()
