--- src/link.c.orig	2024-11-01 20:22:40 UTC
+++ src/link.c
@@ -66,26 +66,26 @@ static CURL *Link_to_curl(Link *link)
     if (ret) {
         lprintf(error, "%s", curl_easy_strerror(ret));
     }
-    ret = curl_easy_setopt(curl, CURLOPT_FOLLOWLOCATION, 1);
+    ret = curl_easy_setopt(curl, CURLOPT_FOLLOWLOCATION, 1L);
     if (ret) {
         lprintf(error, "%s", curl_easy_strerror(ret));
     }
     /*
      * for following directories without the '/'
      */
-    ret = curl_easy_setopt(curl, CURLOPT_MAXREDIRS, 2);
+    ret = curl_easy_setopt(curl, CURLOPT_MAXREDIRS, 2L);
     if (ret) {
         lprintf(error, "%s", curl_easy_strerror(ret));
     }
     ret = curl_easy_setopt(curl, CURLOPT_URL, link->f_url);
     if (ret) {
         lprintf(error, "%s", curl_easy_strerror(ret));
     }
-    ret = curl_easy_setopt(curl, CURLOPT_TCP_KEEPALIVE, 1);
+    ret = curl_easy_setopt(curl, CURLOPT_TCP_KEEPALIVE, 1L);
     if (ret) {
         lprintf(error, "%s", curl_easy_strerror(ret));
     }
-    ret = curl_easy_setopt(curl, CURLOPT_CONNECTTIMEOUT, 15);
+    ret = curl_easy_setopt(curl, CURLOPT_CONNECTTIMEOUT, 15L);
     if (ret) {
         lprintf(error, "%s", curl_easy_strerror(ret));
     }
@@ -118,7 +118,7 @@ static CURL *Link_to_curl(Link *link)
         }
     }
     if (CONFIG.insecure_tls) {
-        ret = curl_easy_setopt(curl, CURLOPT_SSL_VERIFYPEER, 0);
+        ret = curl_easy_setopt(curl, CURLOPT_SSL_VERIFYPEER, 0L);
         if (ret) {
             lprintf(error, "%s", curl_easy_strerror(ret));
         }
@@ -197,7 +197,7 @@ static void Link_req_file_stat(Link *this_link)
 {
     lprintf(debug, "%s\n", this_link->f_url);
     CURL *curl = Link_to_curl(this_link);
-    CURLcode ret = curl_easy_setopt(curl, CURLOPT_NOBODY, 1);
+    CURLcode ret = curl_easy_setopt(curl, CURLOPT_NOBODY, 1L);
     if (ret) {
         lprintf(error, "%s", curl_easy_strerror(ret));
     }
@@ -997,4 +997,4 @@ static void Link_read_range(Link *link, Header *header
     char range_str[64];
-    snprintf(range_str, sizeof(range_str), "%lu-%lu", start, end);
+    snprintf(range_str, sizeof(range_str), "%zu-%zu", start, end);
     lprintf(debug, "%s: %s\n", link->linkname, range_str);
