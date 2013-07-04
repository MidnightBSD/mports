$FreeBSD: ports/devel/antlr/files/patch-lib::cpp::antlr::CharBuffer.hpp,v 1.1 2004/11/15 23:57:59 glewis Exp $

--- lib/cpp/antlr/CharBuffer.hpp.orig	Mon Nov 15 16:35:21 2004
+++ lib/cpp/antlr/CharBuffer.hpp	Mon Nov 15 16:36:04 2004
@@ -8,7 +8,11 @@
  * $Id: patch-lib::cpp::antlr::CharBuffer.hpp,v 1.1 2011-12-21 04:33:29 laffer1 Exp $
  */
 
+#if defined(__GNUC__) && (__GNUC__ < 3 || __GNUC_MINOR__ < 2)
+#include <istream.h>
+#else
 #include <istream>
+#endif
 
 #include <antlr/config.hpp>
 #include <antlr/InputBuffer.hpp>
