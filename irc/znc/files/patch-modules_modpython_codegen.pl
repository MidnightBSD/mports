--- modules/modpython/codegen.pl.orig	2026-05-25 15:53:07.499954000 -0400
+++ modules/modpython/codegen.pl	2026-05-25 15:53:07.525975000 -0400
@@ -171,10 +171,11 @@
 								*alloc = SWIG_OLDOBJ;
 							}
 					} else {
-#if PY_VERSION_HEX>=0x03000000
-						assert(0); /* Should never reach here in Python 3 */
-#endif
+#if PY_VERSION_HEX<0x03000000
 						*cptr = SWIG_Python_str_AsChar(obj);
+#else
+						return SWIG_RuntimeError;
+#endif
 					}
 				}
 				if (psize) *psize = len + 1;
