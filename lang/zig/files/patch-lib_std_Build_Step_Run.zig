--- lib/std/Build/Step/Run.zig.orig
+++ lib/std/Build/Step/Run.zig
@@ -1244,7 +1244,29 @@
     };
     defer environ_map.deinit();
 
-    const opt_generic_result = spawnChildAndCollect(run, argv, &environ_map, has_side_effects, options, fuzz_context) catch |err| term: {
+    const opt_generic_result = spawn: {
+        // Some kernels accept a foreign ELF image before discovering that its
+        // interpreter is missing, then kill the child instead of failing exec.
+        // Check the declared interpreter first so the foreign-executor fallback
+        // receives FileNotFound rather than an unexpected child termination.
+        if (run.argv.items[0] == .artifact) {
+            const exe = run.argv.items[0].artifact.artifact;
+            const target = exe.rootModuleTarget();
+            if (b.graph.host.result.os.tag == .freebsd and
+                (target.os.tag == .openbsd or target.os.tag == .netbsd) and
+                exe.is_linking_libc and exe.linkage != .static)
+            {
+                if (target.dynamic_linker.get()) |dynamic_linker| {
+                    Io.Dir.cwd().access(io, dynamic_linker, .{}) catch |err| switch (err) {
+                        error.FileNotFound => break :spawn error.FileNotFound,
+                        else => {},
+                    };
+                }
+            }
+        }
+
+        break :spawn spawnChildAndCollect(run, argv, &environ_map, has_side_effects, options, fuzz_context);
+    } catch |err| term: {
         // InvalidExe: cpu arch mismatch
         // FileNotFound: can happen with a wrong dynamic linker path
         if (err == error.InvalidExe or err == error.FileNotFound) interpret: {
