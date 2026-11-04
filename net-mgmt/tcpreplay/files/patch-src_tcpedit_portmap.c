--- src/tcpedit/portmap.c.orig	2025-08-27 06:21:35 UTC
+++ src/tcpedit/portmap.c
@@ -332 +332 @@
-        l4 = get_layer4_v4(*ip_hdr, (u_char *)ip_hdr + l3len);
+        l4 = get_layer4_v4(*ip_hdr, (u_char *)*ip_hdr + l3len);
@@ -352 +352 @@
-        l4 = get_layer4_v6(*ip6_hdr, (u_char *)ip6_hdr + l3len);
+        l4 = get_layer4_v6(*ip6_hdr, (u_char *)*ip6_hdr + l3len);
