--- Source/NSTimeZone.m.orig	2022-05-03 20:04:07 UTC
+++ Source/NSTimeZone.m
@@ -1585,7 +1585,7 @@ static NSMapTable	*absolutes = 0;
 	}
 
 
-#if HAVE_TZSET && !defined(__FreeBSD__) && !defined(__OpenBSD__)
+#if HAVE_TZSET && !defined(__FreeBSD__) && !defined(__OpenBSD__) && !defined(__MidnightBSD__)
       /*
        * Try to get timezone from tzset and tzname/daylight.
        * If daylight is non-zero, then tzname[0] is only the name
