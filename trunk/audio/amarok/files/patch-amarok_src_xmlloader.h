
$FreeBSD: ports/audio/amarok/files/patch-amarok_src_xmlloader.h,v 1.1 2006/07/03 14:44:38 mich Exp $

--- amarok/src/xmlloader.h.orig
+++ amarok/src/xmlloader.h
@@ -173,6 +173,7 @@
 
     public: //fucking moc, these should be private
         class ThreadedLoader;
+	friend class ThreadedLoader;
         class SimpleLoader;
 };
 
