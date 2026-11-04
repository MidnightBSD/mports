--- augeas/ffi.py.orig	2020-03-01 17:24:34.176504000 -0500
+++ augeas/ffi.py	2020-03-01 17:24:54.253657000 -0500
@@ -39,7 +39,7 @@
 void free(void *);
 """)
 
-lib = ffi.dlopen("augeas")
+lib = ffi.dlopen("libaugeas.so")
 
 if __name__ == "__main__":
     ffi.compile(verbose=True)
