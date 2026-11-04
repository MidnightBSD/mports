--- vtysh/vtysh.c.orig	2005-04-08 05:46:55.000000000 -0400
+++ vtysh/vtysh.c
@@ -697 +697 @@ char *
-command_generator (char *text, int state)
+command_generator (const char *text, int state)
@@ -728 +728 @@ char **
-new_completion (char *text, int start, int end)
+new_completion (const char *text, int start, int end)
@@ -733 +733 @@ new_completion (char *text, int start, int end)
-  matches = completion_matches (text, command_generator);
+  matches = rl_completion_matches (text, command_generator);
@@ -745 +745 @@ char **
-vtysh_completion (char *text, int start, int end)
+vtysh_completion (const char *text, int start, int end)
@@ -1598,4 +1598,6 @@ vtysh_connect_all()
-int
-vtysh_completion_entry_function (int ignore, int invoking_key)
+char *
+vtysh_completion_entry_function (const char *ignore, int invoking_key)
 {
-  return 0;
+  (void) ignore;
+  (void) invoking_key;
+  return NULL;
@@ -1610 +1612 @@ vtysh_readline_init ()
-  rl_attempted_completion_function = (CPPFunction *)new_completion;
+  rl_attempted_completion_function = new_completion;
