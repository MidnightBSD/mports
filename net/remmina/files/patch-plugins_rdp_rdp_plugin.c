--- plugins/rdp/rdp_plugin.c.orig	2025-01-13 12:00:00 UTC
+++ plugins/rdp/rdp_plugin.c
@@ -2256,3 +2256,3 @@ remmina_rdp_tunnel_init(RemminaProtocolWidget *gp)
 #else
-		char* args = freerdp_settings_get_string(rfi->clientContext.context.settings, FreeRDP_RDP2TCPArgs);
+		const char* args = freerdp_settings_get_string(rfi->clientContext.context.settings, FreeRDP_RDP2TCPArgs);
 #endif
@@ -2258,4 +2258,4 @@ remmina_rdp_tunnel_init(RemminaProtocolWidget *gp)
-		REMMINA_PLUGIN_DEBUG(RDP2TCP_DVC_CHANNEL_NAME " set to %s",args);
-		remmina_rdp_load_static_channel_addin(channels, rfi->clientContext.context.settings, RDP2TCP_DVC_CHANNEL_NAME, args);
+		REMMINA_PLUGIN_DEBUG(RDP2TCP_DVC_CHANNEL_NAME " set to %s",args);
+		remmina_rdp_load_static_channel_addin(channels, rfi->clientContext.context.settings, RDP2TCP_DVC_CHANNEL_NAME, (void *)args);
-	}
+	}
