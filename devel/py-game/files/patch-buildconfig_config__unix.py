--- buildconfig/config_unix.py.orig	2020-12-24 13:41:52 UTC
+++ buildconfig/config_unix.py
@@ -212,8 +212,9 @@ def main(sdl2=False):
         #Dependency('GFX', 'SDL_gfxPrimitives.h', 'libSDL_gfx.so', ['SDL_gfx']),
     ])
     is_freebsd = 'FreeBSD' in platform.system()
+    is_midnightbsd = 'MidnightBSD' in platform.system()
     is_hurd = platform.system() == 'GNU'
-    if not is_freebsd and not is_hurd:
+    if not is_freebsd and not is_hurd and not is_midnightbsd:
         porttime_dep = get_porttime_dep()
         DEPS.append(
             Dependency('PORTMIDI', 'portmidi.h', 'libportmidi.so', ['portmidi'])
