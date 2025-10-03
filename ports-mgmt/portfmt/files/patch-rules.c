--- rules.c.orig	2025-04-04 06:59:34.000000000 -0400
+++ rules.c	2025-08-25 14:04:08.363887000 -0400
@@ -1,7 +1,7 @@
 /*-
- * SPDX-License-Identifier: BSD-2-Clause-FreeBSD
+ * SPDX-License-Identifier: BSD-2-Clause-Midnightbsd
  *
- * Copyright (c) 2019 Tobias Kortkamp <tobik@FreeBSD.org>
+ * Copyright (c) 2019 Tobias Kortkamp <tobik@Midnightbsd.org>
  * All rights reserved.
  *
  * Redistribution and use in source and binary forms, with or without
@@ -167,8 +167,8 @@
 	{ "do-install", 1 },
 	{ "post-install", 1 },
 	{ "post-install-script", 0 },
-	{ "stage", 0 },
-	{ "post-stage", 1 },
+	{ "fake", 0 },
+	{ "post-fake", 1 },
 	{ "test", 0 },
 	{ "pre-test", 1 },
 	{ "do-test", 1 },
@@ -246,7 +246,7 @@
 	{ "readmes", 0 },
 	{ "reinstall", 0 },
 	{ "repackage", 0 },
-	{ "restage", 0 },
+	{ "refake", 0 },
 	{ "rmconfig-recursive", 0 },
 	{ "rmconfig", 0 },
 	{ "run-autotools-fixup", 0 },
@@ -389,6 +389,9 @@
 	{ BLOCK_LICENSE_OLD, "LEGAL_PACKAGE", VAR_DEFAULT, {} },
 	{ BLOCK_LICENSE_OLD, "LEGAL_TEXT", VAR_IGNORE_WRAPCOL, {} },
 
+        { BLOCK_FAKE, "FAKE_OPTS", VAR_IGNORE_WRAPCOL, {} },
+        { BLOCK_FAKE, "SKIP_FAKE_CHECK", VAR_IGNORE_WRAPCOL, {} },
+
 	{ BLOCK_BROKEN, "DEPRECATED", VAR_IGNORE_WRAPCOL, {} },
 	{ BLOCK_BROKEN, "EXPIRATION_DATE", VAR_SKIP_GOALCOL, {} },
 	{ BLOCK_BROKEN, "FORBIDDEN", VAR_IGNORE_WRAPCOL, {} },
@@ -1403,7 +1406,7 @@
 extract_osrel_prefix(struct Mempool *pool, const char *var, char **prefix)
 {
 	for (size_t i = 0; i < freebsd_versions_len; i++) {
-		char *suffix = str_printf(pool, "_%s_%" PRIu32, "FreeBSD", freebsd_versions[i]);
+		char *suffix = str_printf(pool, "_%s_%" PRIu32, "Midnightbsd", freebsd_versions[i]);
 		if (str_endswith(var, suffix)) {
 			*prefix = str_ndup(pool, var, strlen(var) - strlen(suffix));
 			return true;
@@ -1640,7 +1643,7 @@
 	if (node->type == AST_INCLUDE &&
 	    node->include.type == AST_INCLUDE_BMAKE &&
 	    node->include.sys) {
-		if (strcmp(node->include.path, "bsd.port.options.mk") == 0 ||
+		if (strcmp(node->include.path, "bsd.mport.options.mk") == 0 ||
 		    strcmp(node->include.path, "bsd.port.pre.mk") == 0 ||
 		    strcmp(node->include.path, "bsd.port.post.mk") == 0 ||
 		    strcmp(node->include.path, "bsd.port.mk") == 0) {
