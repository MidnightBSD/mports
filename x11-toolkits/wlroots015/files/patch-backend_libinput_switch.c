--- backend/libinput/switch.c.orig
+++ backend/libinput/switch.c
@@ -40,6 +40,8 @@
 	case LIBINPUT_SWITCH_TABLET_MODE:
 		wlr_event.switch_type = WLR_SWITCH_TYPE_TABLET_MODE;
 		break;
+	default:
+		return;
 	}
 	switch (libinput_event_switch_get_switch_state(sevent)) {
 	case LIBINPUT_SWITCH_STATE_OFF:
