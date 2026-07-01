--- src/lisp.h.orig	2025-05-15 18:36:15 UTC
+++ src/lisp.h
@@ -306,7 +306,11 @@ DEFINE_GDB_SYMBOL_END (VALMASK)
    struct Lisp_Symbol needs the check because of lispsym and struct
    Lisp_Cons needs it because of STACK_CONS.  */

-#define GCALIGNED_UNION_MEMBER char alignas (GCALIGNMENT) gcaligned;
+#if HAVE_STRUCT_ATTRIBUTE_ALIGNED
+# define GCALIGNED_UNION_MEMBER char gcaligned __attribute__ ((aligned (GCALIGNMENT)));
+#else
+# define GCALIGNED_UNION_MEMBER char alignas (GCALIGNMENT) gcaligned;
+#endif
 #if HAVE_STRUCT_ATTRIBUTE_ALIGNED
 # define GCALIGNED_STRUCT __attribute__ ((aligned (GCALIGNMENT)))
 #else
