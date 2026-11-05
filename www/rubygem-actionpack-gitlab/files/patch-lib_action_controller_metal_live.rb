GHSA-rwvh-fw6r-pwvp: upstream Rails security fix backported to Rails 7.2.3.
Source: https://github.com/rails/rails/commit/27ad18ed5900dee28ba20e9c6fc718ff751fa215.patch

index e0fe5384a24f2..2c22324604ccc 100644
--- lib/action_controller/metal/live.rb	2025-10-28 23:24:00 UTC
+++ lib/action_controller/metal/live.rb
@@ -218,7 +218,11 @@ def write(string)
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
@@ -236,14 +240,14 @@ def writeln(string)
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
@@ -255,6 +259,8 @@ def close
       def abort
         synchronize do
           @aborted = true
+          @buf.close
           @buf.clear
+          @cv.broadcast
         end
       end
