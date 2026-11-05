GHSA-rwvh-fw6r-pwvp: upstream Rails security fix backported to Rails 7.0.10.
Source: https://github.com/rails/rails/commit/27ad18ed5900dee28ba20e9c6fc718ff751fa215.patch

--- lib/action_controller/metal/live.rb.orig	2026-11-04 14:48:25 UTC
+++ lib/action_controller/metal/live.rb
@@ -154,7 +154,11 @@
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
@@ -180,7 +184,7 @@
       def close
         synchronize do
           super
-          @buf.push nil
+          @buf.close
           @cv.broadcast
         end
       end
@@ -193,6 +197,8 @@
       def abort
         synchronize do
           @aborted = true
+          @buf.close
           @buf.clear
+          @cv.broadcast
         end
       end
