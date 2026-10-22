--- src/setup_node_env/exit_on_warning.js.orig	2026-10-22 18:30:00 UTC
+++ src/setup_node_env/exit_on_warning.js
@@ -34,6 +34,8 @@
   var ignore = ['MaxListenersExceededWarning', 'NodeDeprecationWarning'];
   process.on('warning', function (warn) {
     if (ignore.includes(warn.name)) return;
+    // url.parse() is runtime-deprecated since Node.js 24
+    if (warn.code === 'DEP0169') return;
     if (process.traceProcessWarnings === true) {
       console.error('Node.js process-warning detected - Terminating process...');
     } else {
