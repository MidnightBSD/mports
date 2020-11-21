--- src/wp/ap/gtk/ap_UnixApp.cpp.orig	2019-04-03 22:28:26 UTC
+++ src/wp/ap/gtk/ap_UnixApp.cpp
@@ -863,7 +863,7 @@ static bool is_so (const char *file) {
	if (len < (strlen(G_MODULE_SUFFIX) + 2)) // this is ".so" and at least one char for the filename
		return false;
	const char *suffix = file+(len-3);
-	if(0 == strcmp (suffix, "."G_MODULE_SUFFIX))
+	if(0 == strcmp (suffix, "." G_MODULE_SUFFIX))
		return true;
	return false;
 }
