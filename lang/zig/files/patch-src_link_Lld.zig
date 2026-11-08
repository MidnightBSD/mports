--- src/link/Lld.zig.orig
+++ src/link/Lld.zig
@@ -1348,7 +1348,10 @@
         },
         .x86_64 => switch (target.abi) {
             .gnux32, .muslx32 => "elf32_x86_64",
-            else => "elf_x86_64",
+            else => switch (target.os.tag) {
+                .freebsd => "elf_x86_64_fbsd",
+                else => "elf_x86_64",
+            },
         },
         else => null,
     };
