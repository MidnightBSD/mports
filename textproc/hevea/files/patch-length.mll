--- length.mll.orig	2018-01-11 09:30:26 UTC
+++ length.mll
@@ -67,3 +67,4 @@
+let float_round x = floor (x +. 0.5)
-let pixel_of_em x = Pixel (int_of_float (Float.round (float_of_int pixels_per_char *. x)))
-and pixel_of_point x = Pixel (int_of_float (Float.round (x /. points_per_pixel)))
-and as_percent x = Percent (int_of_float (Float.round x))
+let pixel_of_em x = Pixel (int_of_float (float_round (float_of_int pixels_per_char *. x)))
+and pixel_of_point x = Pixel (int_of_float (float_round (x /. points_per_pixel)))
+and as_percent x = Percent (int_of_float (float_round x))
