--- main.cc.orig	Wed Sep 19 21:33:05 2007
+++ main.cc	Wed Sep 19 21:34:27 2007
@@ -56,7 +56,7 @@
 	}
 	CHECK_PTR(main);
 	main->setMinimumSize(200, 400);
-	main->setCaption("FreeBSD Package Management");
+	main->setCaption("MidnightBSD Package Management");
 	main->show();
 	// Hide the remove button, preventing a remove...
 	main->hideRemove();
