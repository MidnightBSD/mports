--- src/watchdog/observers/inotify_c.py.orig	2024-11-01 14:03:25 UTC
+++ src/watchdog/observers/inotify_c.py
@@ -17,7 +17,7 @@ if TYPE_CHECKING:
 if TYPE_CHECKING:
     from collections.abc import Generator
 
-libc = ctypes.CDLL(None)
+libc = ctypes.CDLL('libinotify.so')
 
 if not hasattr(libc, "inotify_init") or not hasattr(libc, "inotify_add_watch") or not hasattr(libc, "inotify_rm_watch"):
     error = f"Unsupported libc version found: {libc._name}"  # noqa:SLF001
