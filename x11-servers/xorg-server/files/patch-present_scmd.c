From d2ce97bd02c16ae162c49f76a00fc858035f288e Mon Sep 17 00:00:00 2001
From: =?UTF-8?q?B=C5=82a=C5=BCej=20Szczygie=C5=82?= <spaz16@wp.pl>
Date: Thu, 13 Jan 2022 00:47:27 +0100
Subject: present: Check for NULL to prevent crash
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Closes: https://gitlab.freedesktop.org/xorg/xserver/-/issues/1275
Signed-off-by: Błażej Szczygieł <spaz16@wp.pl>
Tested-by: Aaron Plattner <aplattner@nvidia.com>
(cherry picked from commit 22d5818851967408bb7c903cb345b7ca8766094c)
---
 present/present_scmd.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/present/present_scmd.c b/present/present_scmd.c
index 3c68e690b..11391adbb 100644
--- present/present_scmd.c
+++ present/present_scmd.c
@@ -168,6 +168,9 @@ present_scmd_get_crtc(present_screen_priv_ptr screen_priv, WindowPtr window)
     if (!screen_priv->info)
         return NULL;
 
+    if (!screen_priv->info->get_crtc)
+        return NULL;
+
     return (*screen_priv->info->get_crtc)(window);
 }
 
@@ -206,6 +209,9 @@ present_flush(WindowPtr window)
     if (!screen_priv->info)
         return;
 
+    if (!screen_priv->info->flush)
+        return;
+
     (*screen_priv->info->flush) (window);
 }
 
-- 
cgit v1.2.1

