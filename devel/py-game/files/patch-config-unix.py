--- buildconfig/config_unix.py.orig	2020-12-24 08:41:52.848369000 -0500
+++ buildconfig/config_unix.py	2021-04-24 13:50:42.380530000 -0400
@@ -212,6 +212,7 @@
         #Dependency('GFX', 'SDL_gfxPrimitives.h', 'libSDL_gfx.so', ['SDL_gfx']),
     ])
     is_freebsd = 'FreeBSD' in platform.system()
+    is_midnightbsd = 'MidnightBSD' in platform.system()
     is_hurd = platform.system() == 'GNU'
     if not is_freebsd and not is_hurd:
         porttime_dep = get_porttime_dep()
