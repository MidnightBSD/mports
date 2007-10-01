--- lib/cgi.rb.orig	Fri Nov 24 18:40:24 2006
+++ lib/cgi.rb	Fri Nov 24 18:40:51 2006
@@ -1018,7 +1018,7 @@
               else
                 stdinput.read(content_length)
               end
-          if c.nil?
+          if c.nil? || c.empty?
             raise EOFError, "bad content body"
           end
           buf.concat(c)
