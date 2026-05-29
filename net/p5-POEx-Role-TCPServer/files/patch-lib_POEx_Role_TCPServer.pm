--- lib/POEx/Role/TCPServer.pm.orig	2010-10-01 00:00:00 UTC
+++ lib/POEx/Role/TCPServer.pm
@@ -94 +94,5 @@ role POEx::Role::TCPServer {
-    after _start(@args) is Event {
+    method _set_id(Int $id) {
+        $self->{ID} = $id;
+    }
+
+    after _start(@args) is Event {
