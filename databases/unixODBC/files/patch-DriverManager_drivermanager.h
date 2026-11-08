--- DriverManager/drivermanager.h.orig	2023-07-17 09:35:11 UTC
+++ DriverManager/drivermanager.h
@@ -525,6 +525,8 @@
 void mutex_lib_entry( void );
 void mutex_lib_exit( void );
 
+void mutex_free_handle_entry( void );
+void mutex_free_handle_exit( void );
 void mutex_pool_entry( void );
 void mutex_pool_exit( void );
 
