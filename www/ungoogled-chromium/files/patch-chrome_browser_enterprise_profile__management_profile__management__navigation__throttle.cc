--- chrome/browser/enterprise/profile_management/profile_management_navigation_throttle.cc.orig	2026-10-26 21:13:13 UTC
+++ chrome/browser/enterprise/profile_management/profile_management_navigation_throttle.cc
@@ -61,7 +61,7 @@
   // TODO(crbug.com/40267996): Add actual domains with attribute names.
   profile_attributes->insert(std::make_pair(
       "supported.test",
-      SAMLProfileAttributes("placeholderName", "placeholderToken")));
+      SAMLProfileAttributes{"placeholderName", "placeholderToken"}));
 
   // Extract domains and attributes from the command line switch.
   const base::CommandLine& command_line =
