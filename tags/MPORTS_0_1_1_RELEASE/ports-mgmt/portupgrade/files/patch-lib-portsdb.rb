--- lib/portsdb.rb.orig	Wed Mar 14 21:04:44 2007
+++ lib/portsdb.rb	Wed Mar 14 21:05:03 2007
@@ -27,7 +27,7 @@
     "vietnamese"	=> "vi-",
   }
 
-  MY_PORT = 'sysutils/portupgrade'
+  MY_PORT = 'ports-mgmt/portupgrade'
 
   attr_accessor :ignore_categories, :extra_categories, :moved
 
