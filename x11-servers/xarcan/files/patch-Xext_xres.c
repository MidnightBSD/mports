Backport X.Org November 10, 2026 security fixes from xorg-server 21.1.26.
https://gitlab.freedesktop.org/xorg/xserver/-/commit/6330d2f8
https://gitlab.freedesktop.org/xorg/xserver/-/commit/a77de309

--- Xext/xres.c.orig	2023-12-18 20:29:59 UTC
+++ Xext/xres.c
@@ -579,6 +579,8 @@
     InitConstructClientIdCtx(&ctx);
 
     REQUEST_AT_LEAST_SIZE(xXResQueryClientIdsReq);
+    if (stuff->numSpecs > UINT32_MAX / sizeof(specs[0]))
+        return BadLength;
     REQUEST_FIXED_SIZE(xXResQueryClientIdsReq,
                        stuff->numSpecs * sizeof(specs[0]));
 
@@ -1045,10 +1047,24 @@
 static int _X_COLD
 SProcXResQueryClientIds (ClientPtr client)
 {
+    int i;
+    xXResClientIdSpec *specs;
+
     REQUEST(xXResQueryClientIdsReq);
 
     REQUEST_AT_LEAST_SIZE (xXResQueryClientIdsReq);
     swapl(&stuff->numSpecs);
+    if (stuff->numSpecs > UINT32_MAX / sizeof(*specs))
+        return BadLength;
+    REQUEST_FIXED_SIZE(xXResQueryClientIdsReq,
+                       stuff->numSpecs * sizeof(xXResClientIdSpec));
+
+    specs = (xXResClientIdSpec *) (stuff + 1);
+    for (i = 0; i < stuff->numSpecs; i++) {
+        swapl(&specs[i].client);
+        swapl(&specs[i].mask);
+    }
+
     return ProcXResQueryClientIds(client);
 }
 
@@ -1064,6 +1080,8 @@
 
     REQUEST_AT_LEAST_SIZE(xXResQueryResourceBytesReq);
     swapl(&stuff->numSpecs);
+    if (stuff->numSpecs > UINT32_MAX / sizeof(specs[0]))
+        return BadLength;
     REQUEST_FIXED_SIZE(xXResQueryResourceBytesReq,
                        stuff->numSpecs * sizeof(specs[0]));
 
