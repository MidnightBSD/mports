--- src/api/cover_loader.rs.orig	2025-12-24 14:16:03 UTC
+++ src/api/cover_loader.rs
@@ -25 +24,0 @@
-use glycin::Loader;
@@ -70,4 +69 @@
-        let loader = Loader::for_bytes(&bytes);
-        let image = loader.load_future().await?;
-        let frame = image.next_frame_future().await?;
-        let texture = glycin_gtk4::frame_get_texture(&frame);
+        let texture = Self::texture_from_bytes(&bytes).await?;
@@ -83,4 +79 @@
-        let loader = Loader::for_bytes(&bytes);
-        let image = loader.load_future().await?;
-        let frame = image.next_frame_future().await?;
-        let texture = glycin_gtk4::frame_get_texture(&frame);
+        let texture = Self::texture_from_bytes(&bytes).await?;
@@ -119,0 +113,13 @@
+
+    #[cfg(target_os = "linux")]
+    async fn texture_from_bytes(bytes: &glib::Bytes) -> Result<gdk::Texture> {
+        let loader = glycin::Loader::for_bytes(bytes);
+        let image = loader.load_future().await?;
+        let frame = image.next_frame_future().await?;
+        Ok(glycin_gtk4::frame_get_texture(&frame))
+    }
+
+    #[cfg(not(target_os = "linux"))]
+    async fn texture_from_bytes(bytes: &glib::Bytes) -> Result<gdk::Texture> {
+        Ok(gdk::Texture::from_bytes(bytes)?)
+    }
