--- hotspot/agent/src/share/classes/sun/jvm/hotspot/utilities/PlatformInfo.java.orig	2016-09-03 19:07:44.165158185 -0400
+++ hotspot/agent/src/share/classes/sun/jvm/hotspot/utilities/PlatformInfo.java	2016-09-03 19:07:58.968158308 -0400
@@ -37,7 +37,7 @@
       return "solaris";
     } else if (os.equals("Linux")) {
       return "linux";
-    } else if (os.equals("FreeBSD")) {
+    } else if (os.equals("MidnightBSD")) {
       return "bsd";
     } else if (os.equals("NetBSD")) {
       return "bsd";
