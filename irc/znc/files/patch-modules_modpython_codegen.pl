--- modules/modpython/codegen.pl.orig	2022-07-15 15:39:37 UTC
+++ modules/modpython/codegen.pl
@@ -130,10 +130,10 @@
 						*cptr = cstr;
 						*alloc = SWIG_OLDOBJ;
 					}
 				} else {
 #if PY_VERSION_HEX>=0x03000000
-					assert(0); /* Should never reach here in Python 3 */
-#endif
-					*cptr = SWIG_Python_str_AsChar(obj);
+				return SWIG_RuntimeError;
+#else
+					*cptr = SWIG_Python_str_AsChar(obj);
+#endif
 				}
 			}
 			if (psize) *psize = len + 1;
