--- tests/check_egl_es2.py.orig	2025-08-18 02:12:45 UTC
+++ tests/check_egl_es2.py
@@ -16,7 +16,7 @@
     print('Error before compilation?', glGetError())
     shader = shaders.compileProgram(
         shaders.compileShader(
-            '''#version 130
+            '''#version 100
     attribute vec3 position;
     void main() {
         gl_Position = vec4( position, 0 );
@@ -24,7 +24,8 @@
             GL_VERTEX_SHADER,
         ),
         shaders.compileShader(
-            '''#version 130
+            '''#version 100
+    precision mediump float;
     void main() {
         gl_FragColor = vec4( 0,1,0,.5 );
     }''',
