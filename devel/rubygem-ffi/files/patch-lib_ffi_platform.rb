--- lib/ffi/platform.rb.orig	2026-11-16 05:42:14 UTC
+++ lib/ffi/platform.rb
@@ -42,7 +42,7 @@ module FFI
       "linux"
     when /darwin/
       "darwin"
-    when /freebsd/
+    when /freebsd|midnightbsd/
       "freebsd"
     when /netbsd/
       "netbsd"
@@ -105,7 +105,10 @@ module FFI
     IS_BSD = IS_MAC || IS_FREEBSD || IS_NETBSD || IS_OPENBSD || IS_DRAGONFLYBSD

     # Add the version for known ABI breaks
-    name_version = "12" if IS_FREEBSD && OSVERSION >= 12 # 64-bit inodes
+    # Supported MidnightBSD releases use the FreeBSD 12+ ABI (64-bit inodes).
+    name_version = "12" if IS_FREEBSD && (
+      OSVERSION >= 12 || RbConfig::CONFIG['host_os'].downcase.start_with?("midnightbsd")
+    )

     NAME = FFI.make_shareable("#{ARCH}-#{OS}#{name_version}")
     CONF_DIR = FFI.make_shareable(File.join(File.dirname(__FILE__), 'platform', NAME))
