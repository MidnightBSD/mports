--- ext/extconf.rb.orig	2019-10-31 16:57:02 UTC
+++ ext/extconf.rb
@@ -38,7 +38,12 @@ unless File.exists?("#{CWD}/dst/#{libdir}/libmsgpackc.
         ENV['CC'] = '/usr/bin/gcc-4.2'
       end
       puts "  -- env CFLAGS=#{ENV['CFLAGS'].inspect} LDFLAGS=#{ENV['LDFLAGS'].inspect} CC=#{ENV['CC'].inspect}"
-      sys("./configure --disable-dependency-tracking --disable-shared --with-pic --prefix=#{CWD}/dst/ --libdir=#{CWD}/dst/#{libdir}")
+      host_cpu = RbConfig::CONFIG['host_cpu']
+      host_cpu = 'x86_64' if host_cpu == 'amd64'
+      build = "#{host_cpu}-portbld-freebsd"
+      sys("./configure --build=#{build} --disable-dependency-tracking --disable-shared --with-pic --prefix=#{CWD}/dst/ --libdir=#{CWD}/dst/#{libdir}")
       sys("make install")
+      FileUtils.rm "#{CWD}/src/#{dir}/src/.libs/libmsgpackc.la"
+      FileUtils.rm "#{CWD}/src/#{dir}/src/.libs/libmsgpack.la"
     end
   end
