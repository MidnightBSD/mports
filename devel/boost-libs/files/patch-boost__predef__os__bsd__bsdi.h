--- boost/predef/os/bsd/bsdi.h.orig	2013-10-15 01:23:53.000000000 -0400
+++ boost/predef/os/bsd/bsdi.h	2014-05-06 18:06:28.000000000 -0400
@@ -24,7 +24,7 @@
 
 #define BOOST_OS_BSD_BSDI BOOST_VERSION_NUMBER_NOT_AVAILABLE
 
-#if !BOOST_PREDEF_DETAIL_OS_DETECTED && ( \
+#if !defined(BOOST_PREDEF_DETAIL_OS_DETECTED) && (  \
     defined(__bsdi__) \
     )
 #   ifndef BOOST_OS_BSD_AVAILABLE
