--- bin/install.sh.orig	2022-06-28 10:56:53.592376000 -0400
+++ bin/install.sh	2022-06-28 10:57:31.189830000 -0400
@@ -38,7 +38,7 @@
   install -p $PARAMS $SOURCE $TARGET
   if [ -n "$LCOV_PERL_PATH" ] ; then
     # Replace Perl interpreter specification
-    sed -e "1 s%^#\!.*perl.*$%#\!$LCOV_PERL_PATH%" -i $TARGET
+    sed -e "1 s%^#\!.*perl.*$%#\!$LCOV_PERL_PATH%" -i.bak $TARGET
   fi
 }
 
