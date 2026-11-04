--- sksparse/cholmod.pyx.orig	2023-06-18 19:23:13 UTC
+++ sksparse/cholmod.pyx
@@ -75,7 +75,7 @@ cdef extern from "cholmod.h":
         int print
         int nmethods, postorder
         cholmod_method_struct * method
-        void (*error_handler)(int status, const char * file, int line, const char * msg)
+        void (*error_handler)(int status, const char * file, int line, const char * msg) noexcept

     ctypedef struct cholmod_sparse:
         size_t nrow, ncol, nzmax
@@ -377,7 +377,7 @@ cdef _m_to_dense(cholmod_dense *m):
     return array

 cdef void _error_handler(
-        int status, const char * file, int line, const char * msg) except * with gil:
+        int status, const char * file, int line, const char * msg) noexcept with gil:
     if status == CHOLMOD_OK:
         return
     full_msg = "{}:{:d}: {} (code {:d})".format(file.decode(), line, msg.decode(), status)
@@ -432,7 +432,7 @@ cdef class Common:
         self._common.print = 0
         self._common.error_handler = (
-            <void (*)(int, const char *, int, const char *)>_error_handler)
+            <void (*)(int, const char *, int, const char *) noexcept>_error_handler)

     def __dealloc__(self):
         if self._use_long:
