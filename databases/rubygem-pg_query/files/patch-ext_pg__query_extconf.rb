--- ext/pg_query/extconf.rb.orig	2026-06-03 22:47:00 UTC
+++ ext/pg_query/extconf.rb
@@ -35,7 +35,7 @@ end
 
 def ext_symbols_filename
   name = 'ext_symbols'
-  name += '_freebsd' if RUBY_PLATFORM =~ /freebsd/
+  name += '_freebsd' if RUBY_PLATFORM =~ /freebsd|midnightbsd/
   name += '_openbsd' if RUBY_PLATFORM =~ /openbsd/
   name += '_with_ruby_abi_version' if export_ruby_abi_version
   "#{name}.sym"
