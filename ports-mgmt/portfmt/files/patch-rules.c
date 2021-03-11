--- rules.c.orig	2021-03-11 05:02:48 UTC
+++ rules.c
@@ -1232,7 +1232,7 @@ is_include_bsd_port_mk(struct Token *t)
 	struct Conditional *c = token_conditional(t);
 	return c && token_type(t) == CONDITIONAL_TOKEN &&
 		conditional_type(c) == COND_INCLUDE &&
-		(strcmp(token_data(t), "<bsd.port.options.mk>") == 0 ||
+		(strcmp(token_data(t), "<bsd.mport.options.mk>") == 0 ||
 		strcmp(token_data(t), "<bsd.port.pre.mk>") == 0 ||
 		strcmp(token_data(t), "<bsd.port.post.mk>") == 0 ||
 		strcmp(token_data(t), "<bsd.port.mk>") == 0);
