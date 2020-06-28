--- src/platformsupport/platformsupport.pro.orig	2020-06-28 15:49:36.313386000 -0400
+++ src/platformsupport/platformsupport.pro	2020-06-28 15:50:17.922192000 -0400
@@ -11,7 +11,7 @@
 qtConfig(freetype)|darwin|win32: \
     SUBDIRS += fontdatabases
 
-qtConfig(evdev)|qtConfig(tslib)|qtConfig(libinput)|qtConfig(integrityhid) {
+qtConfig(evdev)|qtConfig(tslib)|qtConfig(libinput)|qtConfig(integrityhid)|qtConfig(xkbcommon) {
     SUBDIRS += input
     input.depends += devicediscovery
 }
