--- boost/cstdint.hpp.orig	2012-09-16 17:52:21 +0000
+++ boost/cstdint.hpp	2012-09-16 17:52:49 +0000
@@ -51,7 +51,7 @@
       // this is triggered with GCC, because it defines __cplusplus < 199707L
 #     define BOOST_NO_INT64_T
 #   endif 
-# elif defined(__FreeBSD__) || defined(__IBMCPP__) || defined(_AIX)
+# elif defined(__MidnightBSD__) || defined(__IBMCPP__) || defined(_AIX)
 #   include <inttypes.h>
 # else
 #   include <stdint.h>
