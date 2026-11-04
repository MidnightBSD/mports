GHSA-rwvh-fw6r-pwvp: upstream Rails security fix backported to Rails 7.1.6.
Source: https://github.com/rails/rails/commit/27ad18ed5900dee28ba20e9c6fc718ff751fa215.patch

--- lib/action_controller/metal/live.rb.orig	2026-11-04 14:48:25 UTC
+++ lib/action_controller/metal/live.rb
@@ -178,7 +178,11 @@
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
@@ -204,7 +208,7 @@
       def close
         synchronize do
           super
-          @buf.push nil
+          @buf.close
           @cv.broadcast
         end
       end
@@ -217,6 +221,8 @@
       def abort
         synchronize do
           @aborted = true
+          @buf.close
           @buf.clear
+          @cv.broadcast
         end
       end
