GHSA-rwvh-fw6r-pwvp: upstream Rails security fix backported to Rails 7.2.3.2.
Source: https://github.com/rails/rails/commit/27ad18ed5900dee28ba20e9c6fc718ff751fa215.patch

--- lib/action_controller/metal/live.rb.orig	2026-11-04 14:48:25 UTC
+++ lib/action_controller/metal/live.rb
@@ -183,7 +183,11 @@
           @response.delete_header "Content-Length"
         end

-        super
+        begin
+          super
+        rescue ClosedQueueError
+          raise IOError, "closed stream" if connected?
+        end

         unless connected?
           @buf.clear
@@ -201,14 +205,14 @@
         write string.end_with?("\n") ? string : "#{string}\n"
       end

-      # Write a 'close' event to the buffer; the producer/writing thread uses this to
-      # notify us that it's finished supplying content.
+      # Close the buffer; the producer/writing thread uses this to notify us that
+      # it's finished supplying content.
       #
       # See also #abort.
       def close
         synchronize do
           super
-          @buf.push nil
+          @buf.close
           @cv.broadcast
         end
       end
@@ -220,6 +224,8 @@
       def abort
         synchronize do
           @aborted = true
+          @buf.close
           @buf.clear
+          @cv.broadcast
         end
       end
