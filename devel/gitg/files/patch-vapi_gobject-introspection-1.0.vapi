--- vapi/gobject-introspection-1.0.vapi.orig	2024-09-09 14:48:55 UTC
+++ vapi/gobject-introspection-1.0.vapi
@@ -1,6 +1,6 @@
-[CCode (cprefix = "GI", lower_case_cprefix = "g_i", cheader_filename = "girepository.h")]
+[CCode (cprefix = "GI", lower_case_cprefix = "gi_", cheader_filename = "girepository/girepository.h")]
 namespace Introspection
 {
-	[CCode (cprefix = "G_IREPOSITORY_ERROR_")]
+	[CCode (cprefix = "GI_REPOSITORY_ERROR_")]
 	public errordomain RepositoryError {
 		TYPELIB_NOT_FOUND,
@@ -9,7 +9,7 @@ namespace Introspection
 		LIBRARY_NOT_FOUND
 	}
 
-	[CCode (cname="int", cprefix = "G_IREPOSITORY_LOAD_FLAG_")]
+	[CCode (cname="int", cprefix = "GI_REPOSITORY_LOAD_FLAG_")]
 	public enum RepositoryLoadFlags {
 		LAZY = 1
 	}
@@ -17,14 +17,14 @@ namespace Introspection
-	[CCode (ref_function = "", unref_function = "")]
-	public class Repository {
+	public class Repository : GLib.Object {
-		public static unowned Repository get_default();
+		[CCode (cname = "gi_repository_dup_default")]
+		public static Repository get_default();
 		public static void prepend_search_path(string directory);
 		public static unowned GLib.SList<string> get_search_path();
 
 		public unowned Typelib? require(string namespace_, string? version = null, RepositoryLoadFlags flags = 0) throws RepositoryError;
 	}
 
 	[Compact]
-	[CCode (cname = "GTypelib", cprefix = "g_typelib_", free_function = "g_typelib_free")]
+	[CCode (cname = "GITypelib", cprefix = "gi_typelib_", free_function = "gi_typelib_free")]
 	public class Typelib {
 		public unowned string get_namespace();
 	}
