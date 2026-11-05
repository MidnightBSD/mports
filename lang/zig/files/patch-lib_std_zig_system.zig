--- lib/std/zig/system.zig.orig
+++ lib/std/zig/system.zig
@@ -271,6 +271,15 @@
 
                 switch (builtin.target.os.tag) {
                     .freebsd => {
+                        var name: [32]u8 = undefined;
+                        var name_len: usize = name.len;
+                        if (posix.system.sysctlbyname("kern.ostype", &name, &name_len, null, 0) != 0)
+                            return error.OSVersionDetectionFail;
+                        if (mem.eql(u8, mem.sliceTo(&name, 0), "MidnightBSD")) {
+                            // MidnightBSD has its own release numbering. Use the
+                            // compatible FreeBSD baseline, not the MidnightBSD version.
+                            value = if (value >= 400000) 1300000 else if (value >= 302000) 1204000 else return error.OSVersionDetectionFail;
+                        }
                         // https://www.freebsd.org/doc/en_US.ISO8859-1/books/porters-handbook/versions.html
                         // Major * 100,000 has been convention since FreeBSD 2.2 (1997)
                         // Minor * 1(0),000 summed has been convention since FreeBSD 2.2 (1997)
