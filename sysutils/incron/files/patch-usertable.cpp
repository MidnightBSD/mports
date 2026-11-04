--- usertable.cpp.bak	2017-11-13 21:08:45.000000000 -0500
+++ usertable.cpp	2022-12-04 12:14:32.681160000 -0500
@@ -571,16 +571,6 @@
   return false; // no access right found
 }
 
-#ifndef __linux__
-static int
-clearenv(void)
-{
-  extern char **environ;
-
-  environ[0] = NULL;
-  return 0;
-}
-#endif
 
 void UserTable::RunAsUser(std::string cmd) const
 {
