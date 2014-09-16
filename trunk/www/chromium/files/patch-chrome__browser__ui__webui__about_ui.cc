--- ./chrome/browser/ui/webui/about_ui.cc.orig	2014-08-12 21:01:37.000000000 +0200
+++ ./chrome/browser/ui/webui/about_ui.cc	2014-08-13 09:56:57.000000000 +0200
@@ -763,7 +763,7 @@
   return data;
 }
 
-#if defined(OS_LINUX) || defined(OS_OPENBSD)
+#if defined(OS_LINUX) || defined(OS_BSD)
 std::string AboutLinuxProxyConfig() {
   std::string data;
   AppendHeader(&data, 0,
@@ -779,6 +779,7 @@
   return data;
 }
 
+#if !defined(OS_BSD)
 void AboutSandboxRow(std::string* data, const std::string& prefix, int name_id,
                      bool good) {
   data->append("<tr><td>");
@@ -849,6 +850,7 @@
   return data;
 }
 #endif
+#endif
 
 // AboutMemoryHandler ----------------------------------------------------------
 
@@ -1019,7 +1021,7 @@
   } else if (source_name_ == chrome::kChromeUIDNSHost) {
     AboutDnsHandler::Start(profile(), callback);
     return;
-#if defined(OS_LINUX) || defined(OS_OPENBSD)
+#if defined(OS_LINUX) || defined(OS_BSD)
   } else if (source_name_ == chrome::kChromeUILinuxProxyConfigHost) {
     response = AboutLinuxProxyConfig();
 #endif
