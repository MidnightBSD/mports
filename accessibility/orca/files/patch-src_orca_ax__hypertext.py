--- src/orca/ax_hypertext.py.orig	2026-09-11 00:00:00 UTC
+++ src/orca/ax_hypertext.py
@@ -17,6 +17,8 @@
 # Boston MA  02110-1301 USA.
 
 """Wrapper for the Atspi.Hypertext and Hyperlink interfaces."""

+from __future__ import annotations
+
 import os
 import re
 from urllib.parse import urlparse
