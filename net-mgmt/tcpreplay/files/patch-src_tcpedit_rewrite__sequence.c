--- src/tcpedit/rewrite_sequence.c.orig	2025-08-27 06:21:35 UTC
+++ src/tcpedit/rewrite_sequence.c
@@ -65 +65 @@
-        tcp_hdr_t *tcp_hdr = (tcp_hdr_t *)get_layer4_v4(*ip_hdr, (u_char *)ip_hdr + l3len);
+        tcp_hdr_t *tcp_hdr = (tcp_hdr_t *)get_layer4_v4(*ip_hdr, (u_char *)*ip_hdr + l3len);
@@ -85 +85 @@
-        tcp_hdr_t *tcp_hdr = (tcp_hdr_t *)get_layer4_v6(*ip6_hdr, (u_char *)ip6_hdr + l3len);
+        tcp_hdr_t *tcp_hdr = (tcp_hdr_t *)get_layer4_v6(*ip6_hdr, (u_char *)*ip6_hdr + l3len);
