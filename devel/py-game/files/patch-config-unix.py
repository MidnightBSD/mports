--- buildconfig/config_unix.py.orig	2020-01-21 18:10:50.512770000 -0500
+++ buildconfig/config_unix.py	2020-01-21 18:11:12.066330000 -0500
@@ -221,8 +221,8 @@
         Dependency('SCRAP', '', 'libX11', ['X11']),
         #Dependency('GFX', 'SDL_gfxPrimitives.h', 'libSDL_gfx.so', ['SDL_gfx']),
     ])
-    is_freebsd = platform.system() == 'FreeBSD'
-    if not is_freebsd:
+    is_midnightbsd = platform.system() == 'MidnightBSD'
+    if not is_midnightbsd:
         porttime_dep = get_porttime_dep()
         DEPS.append(
             Dependency('PORTMIDI', 'portmidi.h', 'libportmidi.so', ['portmidi'])
