--- src/ent/org/elasticsearch/entitlement/runtime/policy/entitlements/FilesEntitlement.java.orig	2026-10-15 00:00:00 UTC
+++ src/ent/org/elasticsearch/entitlement/runtime/policy/entitlements/FilesEntitlement.java
@@ -172,8 +172,10 @@
             return Platform.MACOS;
         } else if (platform.equals("windows")) {
             return Platform.WINDOWS;
+        } else if (platform.equals("midnightbsd") || platform.equals("freebsd")) {
+            return Platform.BSD;
         } else {
-            throw new PolicyValidationException("invalid platform: " + platform + ", valid values: [linux, macos, windows]");
+            throw new PolicyValidationException("invalid platform: " + platform + ", valid values: [linux, macos, windows, midnightbsd, freebsd]");
         }
     }
 
