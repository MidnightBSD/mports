--- setup.py.orig	2025-10-23 11:39:19 UTC
+++ setup.py
@@ -280,8 +280,9 @@
             args.append("-DIGRAPH_GRAPHML_SUPPORT:BOOL=OFF")
 
         # Build the Python interface with vendored libraries
-        for deps in "ARPACK BLAS GLPK GMP LAPACK PLFIT".split():
-            args.append("-DIGRAPH_USE_INTERNAL_" + deps + "=ON")
+        for deps in "ARPACK BLAS GLPK GMP LAPACK".split():
+            args.append("-DIGRAPH_USE_INTERNAL_" + deps + "=OFF")
+        args.append("-DIGRAPH_USE_INTERNAL_PLFIT=ON")
 
         # Use link-time optinization if available
         args.append("-DIGRAPH_ENABLE_LTO=AUTO")
@@ -292,6 +293,12 @@
 
         # No need to build tests
         args.append("-DBUILD_TESTING=OFF")
+
+        # Always use flex from ports
+        args.append("-DFLEX_EXECUTABLE:FILEPATH=/usr/local/bin/flex")
+
+        # Don't try to use git
+        args.append("-DCMAKE_DISABLE_FIND_PACKAGE_Git:BOOL=True")
 
         # Do not treat compilation warnings as errors in case someone is trying
         # to "pip install" igraph in an environment for which we don't provide
