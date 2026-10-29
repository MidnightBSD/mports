--- tools/json_schema_compiler/feature_compiler.py.orig	2026-10-26 21:13:13 UTC
+++ tools/json_schema_compiler/feature_compiler.py
@@ -249,6 +249,8 @@
         'chromeos': 'Feature::CHROMEOS_PLATFORM',
         'desktop_android': 'Feature::DESKTOP_ANDROID_PLATFORM',
         'linux': 'Feature::LINUX_PLATFORM',
+        'openbsd': 'Feature::LINUX_PLATFORM',
+        'freebsd': 'Feature::LINUX_PLATFORM',
         'mac': 'Feature::MACOSX_PLATFORM',
         'win': 'Feature::WIN_PLATFORM',
       }
