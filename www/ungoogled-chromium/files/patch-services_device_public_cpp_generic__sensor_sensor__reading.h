--- services/device/public/cpp/generic_sensor/sensor_reading.h.orig	2026-10-26 21:13:13 UTC
+++ services/device/public/cpp/generic_sensor/sensor_reading.h
@@ -7,6 +7,8 @@
 
 #include <stddef.h>
 #include <stdint.h>
+
+#include <cstdint>
 
 #include <array>
 #include <type_traits>
