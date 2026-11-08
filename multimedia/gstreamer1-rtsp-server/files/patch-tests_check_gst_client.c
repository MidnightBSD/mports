--- tests/check/gst/client.c.orig
+++ tests/check/gst/client.c
@@ -18,0 +19,2 @@
+
+#include <sys/socket.h>
@@ -2251,0 +2254,7 @@
+  GSocketListener *listener;
+  GSocketClient *connector;
+  GSocketConnection *peer;
+  GSocket *accepted;
+  GSocketAddress *bind_address, *effective_address;
+  GError *error = NULL;
+  struct linger reset = { 1, 0 };
@@ -2255 +2264,23 @@
-  create_connection (&conn);
+  /* A real peer is needed: closing an unconnected local socket does not
+   * guarantee that its I/O source reports EOF on every platform. */
+  listener = g_socket_listener_new ();
+  bind_address = g_inet_socket_address_new_from_string ("127.0.0.1", 0);
+  fail_unless (g_socket_listener_add_address (listener, bind_address,
+          G_SOCKET_TYPE_STREAM, G_SOCKET_PROTOCOL_TCP, NULL, &effective_address,
+          &error));
+  g_assert_no_error (error);
+  g_object_unref (bind_address);
+  connector = g_socket_client_new ();
+  peer = g_socket_client_connect_to_host (connector, "127.0.0.1",
+      g_inet_socket_address_get_port (G_INET_SOCKET_ADDRESS (effective_address)),
+      NULL, &error);
+  g_assert_no_error (error);
+  fail_unless (peer != NULL);
+  accepted = g_socket_listener_accept_socket (listener, NULL, NULL, &error);
+  g_assert_no_error (error);
+  fail_unless (gst_rtsp_connection_create_from_socket (accepted, "127.0.0.1",
+          444, NULL, &conn) == GST_RTSP_OK);
+  g_object_unref (accepted);
+  g_object_unref (connector);
+  g_object_unref (effective_address);
+  g_object_unref (listener);
@@ -2295,3 +2326,8 @@
-  /* close the connection */
-  gst_rtsp_connection_close (ctx.conn);
-  while (!g_main_context_iteration (NULL, TRUE));
+  /* Terminate the peer with the TCP RST described by this test. */
+  fail_unless (setsockopt (g_socket_get_fd (g_socket_connection_get_socket (peer)),
+          SOL_SOCKET, SO_LINGER, &reset, sizeof (reset)) == 0);
+  fail_unless (g_io_stream_close (G_IO_STREAM (peer), NULL, &error));
+  g_assert_no_error (error);
+  g_object_unref (peer);
+  while (!pre_closed_called)
+    g_main_context_iteration (NULL, TRUE);
