MidnightBSD's libutil.h declares easprintf()/evasprintf(), which roken.h
has already redefined to rk_easprintf/rk_evasprintf. Those take different
arguments and return types, so the renamed declarations conflict:

  /usr/include/libutil.h:155:6: error: conflicting types for 'rk_evasprintf'

Hide the macros across the include and restore them afterwards.

--- third_party/heimdal/kdc/headers.h.orig
+++ third_party/heimdal/kdc/headers.h
@@ -84,8 +84,24 @@
 #include <util.h>
 #endif
 #ifdef HAVE_LIBUTIL_H
+/*
+ * MidnightBSD's libutil.h declares easprintf()/evasprintf(), which roken.h
+ * has already redefined to the rk_* equivalents. Those take different
+ * arguments, so the renamed declarations clash. Hide the macros across the
+ * include and restore them afterwards for heimdal's own callers.
+ */
+#ifdef __MidnightBSD__
+#pragma push_macro("easprintf")
+#pragma push_macro("evasprintf")
+#undef easprintf
+#undef evasprintf
+#endif
 #include <libutil.h>
+#ifdef __MidnightBSD__
+#pragma pop_macro("evasprintf")
+#pragma pop_macro("easprintf")
 #endif
+#endif
 #include <err.h>
 #include <roken.h>
 #include <getarg.h>
