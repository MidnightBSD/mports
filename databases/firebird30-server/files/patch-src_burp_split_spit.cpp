--- src/burp/split/spit.cpp.orig
+++ src/burp/split/spit.cpp
@@ -125,9 +125,9 @@
 
 const static Switches::in_sw_tab_t spit_in_sw_table[] =
 {
-	{IN_SW_SPIT_SP,	0,	"SPLIT_BK_FILE", 0, 0, 0, false, 0, 0, NULL},
-	{IN_SW_SPIT_JT,	0,	"JOIN_BK_FILE",	 0, 0, 0, false, 0, 0, NULL},
-	{IN_SW_SPIT_0,	0,	NULL,			 0, 0, 0, false, 0, 0, NULL}
+	{IN_SW_SPIT_SP,	0,	"SPLIT_BK_FILE", 0, 0, 0, false, 0, 0, 0, NULL},
+	{IN_SW_SPIT_JT,	0,	"JOIN_BK_FILE",	 0, 0, 0, false, 0, 0, 0, NULL},
+	{IN_SW_SPIT_0,	0,	NULL,			 0, 0, 0, false, 0, 0, 0, NULL}
 };
 
 
