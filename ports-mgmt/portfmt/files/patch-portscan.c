--- portscan.c.orig	2022-09-09 16:33:10 UTC
+++ portscan.c
@@ -610,9 +610,9 @@ scan_ports(struct Workqueue *workqueue, int portsdir, 
 		return;
 	}
 
-	FILE *in = fileopenat(pool, portsdir, "Mk/bsd.options.desc.mk");
+	FILE *in = fileopenat(pool, portsdir, "Mk/components/options.desc.mk");
 	if (in == NULL) {
-		portscan_log_add_entry(retval, PORTSCAN_LOG_ENTRY_ERROR, "Mk/bsd.options.desc.mk",
+		portscan_log_add_entry(retval, PORTSCAN_LOG_ENTRY_ERROR, "Mk/components/options.desc.mk",
 			str_printf(pool, "fileopenat: %s", strerror(errno)));
 		return;
 	}
@@ -622,18 +622,18 @@ scan_ports(struct Workqueue *workqueue, int portsdir, 
 	struct Parser *parser = parser_new(pool, &settings);
 	enum ParserError error = parser_read_from_file(parser, in);
 	if (error != PARSER_ERROR_OK) {
-		portscan_log_add_entry(retval, PORTSCAN_LOG_ENTRY_ERROR, "Mk/bsd.options.desc.mk", parser_error_tostring(parser, pool));
+		portscan_log_add_entry(retval, PORTSCAN_LOG_ENTRY_ERROR, "Mk/components/options.desc.mk", parser_error_tostring(parser, pool));
 		return;
 	}
 	error = parser_read_finish(parser);
 	if (error != PARSER_ERROR_OK) {
-		portscan_log_add_entry(retval, PORTSCAN_LOG_ENTRY_ERROR, "Mk/bsd.options.desc.mk", parser_error_tostring(parser, pool));
+		portscan_log_add_entry(retval, PORTSCAN_LOG_ENTRY_ERROR, "Mk/components/options.desc.mk", parser_error_tostring(parser, pool));
 		return;
 	}
 
 	struct Map *default_option_descriptions = NULL;
 	if (parser_edit(parser, pool, get_default_option_descriptions, &default_option_descriptions) != PARSER_ERROR_OK) {
-		portscan_log_add_entry(retval, PORTSCAN_LOG_ENTRY_ERROR, "Mk/bsd.options.desc.mk", parser_error_tostring(parser, pool));
+		portscan_log_add_entry(retval, PORTSCAN_LOG_ENTRY_ERROR, "Mk/components/options.desc.mk", parser_error_tostring(parser, pool));
 		return;
 	}
 	panic_unless(default_option_descriptions, "no default option descriptions found");
@@ -793,7 +793,7 @@ main(int argc, char *argv[])
 	}
 
 	if (portsdir_path == NULL) {
-		portsdir_path = "/usr/ports";
+		portsdir_path = "/usr/mports";
 	}
 
 	if (isatty(STDERR_FILENO)) {
