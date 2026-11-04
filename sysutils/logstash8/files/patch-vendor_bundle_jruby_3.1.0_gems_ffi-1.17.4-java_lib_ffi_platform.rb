--- vendor/bundle/jruby/3.1.0/gems/ffi-1.17.4-java/lib/ffi/platform.rb.orig	2026-09-29 21:02:01 UTC
+++ vendor/bundle/jruby/3.1.0/gems/ffi-1.17.4-java/lib/ffi/platform.rb
@@ -42,7 +42,7 @@
       "linux"
     when /darwin/
       "darwin"
-    when /freebsd/
+    when /freebsd|midnightbsd/
       "freebsd"
     when /netbsd/
       "netbsd"
@@ -105,7 +105,8 @@
     IS_BSD = IS_MAC || IS_FREEBSD || IS_NETBSD || IS_OPENBSD || IS_DRAGONFLYBSD
 
     # Add the version for known ABI breaks
-    name_version = "12" if IS_FREEBSD && OSVERSION >= 12 # 64-bit inodes
+    name_version = "12" if IS_FREEBSD &&
+      (OSVERSION >= 12 || RbConfig::CONFIG['host_os'].downcase.include?("midnightbsd")) # 64-bit inodes
 
     NAME = FFI.make_shareable("#{ARCH}-#{OS}#{name_version}")
     CONF_DIR = FFI.make_shareable(File.join(File.dirname(__FILE__), 'platform', NAME))
