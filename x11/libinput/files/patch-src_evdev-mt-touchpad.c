--- src/evdev-mt-touchpad.c.orig	2026-10-11 00:00:00 UTC
+++ src/evdev-mt-touchpad.c
@@ -1904,10 +1904,16 @@
 		 * timestamp deltas (see e.g. #1145).
 		 *
 		 * Let's drop this frame, hoping it wasn't important.
+		 *
+		 * The BSD evdev implementation terminates *every* frame
+		 * with a SYN_REPORT of value 1, so this heuristic would
+		 * discard all touchpad input there.  Only apply it on Linux.
 		 */
+#ifdef __linux__
 		if (ev_syn->value == 1) {
 			return;
 		}
+#endif
 	} else {
 		evdev_log_bug_libinput(device, "Terminating event is not a SYN_REPORT");
 	}
