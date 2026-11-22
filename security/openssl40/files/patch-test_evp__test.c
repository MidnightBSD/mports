--- test/evp_test.c.orig	2026-09-29 13:44:55 UTC
+++ test/evp_test.c
@@ -5395,7 +5395,10 @@
                 t->s.test_file, t->s.start, t->meth->name);
             goto err;
         }
-        if (!check_test_error(t)) {
+        /* run_test may decide at run time that the test must be skipped */
+        if (t->skip) {
+            t->s.numskip++;
+        } else if (!check_test_error(t)) {
             TEST_openssl_errors();
             t->s.errors++;
         }
