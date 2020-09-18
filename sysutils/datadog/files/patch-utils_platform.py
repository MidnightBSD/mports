--- utils/platform.py.orig	2016-09-30 11:30:59.000000000 -0400
+++ utils/platform.py	2020-09-18 15:54:39.953835000 -0400
@@ -13,6 +13,8 @@
         return 'mac'
     elif sys.platform.find('freebsd') != -1:
         return 'freebsd'
+    elif sys.platform.find('midnightbsd') != -1:
+        return 'midnightbsd'
     elif sys.platform.find('linux') != -1:
         return 'linux'
     elif sys.platform.find('win32') != -1:
@@ -41,6 +43,11 @@
         return name.startswith("freebsd")
 
     @staticmethod
+    def is_midnightbsd(name=None):
+        name = name or sys.platform
+        return name.startswith("midnightbsd")
+
+    @staticmethod
     def is_linux(name=None):
         name = name or sys.platform
         return 'linux' in name
@@ -49,7 +56,7 @@
     def is_bsd(name=None):
         """ Return true if this is a BSD like operating system. """
         name = name or sys.platform
-        return Platform.is_darwin(name) or Platform.is_freebsd(name)
+        return Platform.is_darwin(name) or Platform.is_freebsd(name) or Platform.is_midnightbsd(name)
 
     @staticmethod
     def is_solaris(name=None):
@@ -64,6 +71,7 @@
             Platform.is_darwin()
             or Platform.is_linux()
             or Platform.is_freebsd()
+            or Platform.is_midnightbsd()
         )
 
     @staticmethod
@@ -84,8 +92,7 @@
 
     @staticmethod
     def is_ecs_instance():
-        from utils.dockerutil import DockerUtil
-        return DockerUtil().is_ecs()
+        return False
 
     @staticmethod
     def is_containerized():
