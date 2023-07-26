From 2355155640494ba212c00be410bc3de9d1e131c0 Mon Sep 17 00:00:00 2001
From: nerdopolis <rbos@rbos>
Date: Thu, 30 Sep 2021 08:51:18 -0400
Subject: xf86: Accept devices with the 'simpledrm' driver.

SimpleDRM 'devices' are a fallback device, and do not have a busid
so they are getting skipped. This will allow simpledrm to work
with the modesetting driver

(cherry picked from commit b9218fadf3c09d83566549279d68886d8258f79c)
Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 hw/xfree86/common/xf86platformBus.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/xfree86/common/xf86platformBus.c b/hw/xfree86/common/xf86platformBus.c
index cef47da03..d4fdab3c2 100644
--- hw/xfree86/common/xf86platformBus.c
+++ hw/xfree86/common/xf86platformBus.c
@@ -546,8 +546,13 @@ xf86platformProbeDev(DriverPtr drvp)
             }
             else {
                 /* for non-seat0 servers assume first device is the master */
-                if (ServerIsNotSeat0())
+                if (ServerIsNotSeat0()) {
                     break;
+                } else {
+                    /* Accept the device if the driver is simpledrm */
+                    if (strcmp(xf86_platform_devices[j].attribs->driver, "simpledrm") == 0)
+                        break;
+                }
 
                 if (xf86IsPrimaryPlatform(&xf86_platform_devices[j]))
                     break;
-- 
cgit v1.2.1

