--- tests/xlibegltest.py.orig	2025-08-18 02:12:45 UTC
+++ tests/xlibegltest.py
@@ -115,7 +115,10 @@
         window = self.window.id
         self.egl_surface = eglCreateWindowSurface(display, configs[0], window, None)
 
-        self.egl_ctx = eglCreateContext(display, configs[0], EGL_NO_CONTEXT, None)
+        ctx_attrs = arrays.GLintArray.asArray(
+            [EGL_CONTEXT_CLIENT_VERSION, 2, EGL_NONE]
+        ) if API_BITS[self.api.lower()] == EGL_OPENGL_ES2_BIT else None
+        self.egl_ctx = eglCreateContext(display, configs[0], EGL_NO_CONTEXT, ctx_attrs)
         if self.egl_ctx == EGL_NO_CONTEXT:
             raise RuntimeError("Unable to create context")
 
