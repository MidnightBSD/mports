--- ETree/src/transform.c.orig	1998-01-30 09:33:24 UTC
+++ ETree/src/transform.c
@@ -291,7 +291,7 @@
    remap the nzeros[] vector
    -------------------------
 */
-temp = IVinit(nfront, NULL) ;
+temp = IVinit(nfront, 0) ;
 IVcopy(nfront, temp, nzeros) ;
 IV_setSize(nzerosIV, nnew) ;
 nzeros = IV_entries(nzerosIV) ;
@@ -453,7 +453,7 @@
    remap the nzeros[] vector
    -------------------------
 */
-temp = IVinit(nfront, NULL) ;
+temp = IVinit(nfront, 0) ;
 IVcopy(nfront, temp, nzeros) ;
 IV_setSize(nzerosIV, nnew) ;
 nzeros = IV_entries(nzerosIV) ;
@@ -614,7 +614,7 @@
    remap the nzeros[] vector
    -------------------------
 */
-temp = IVinit(nfront, NULL) ;
+temp = IVinit(nfront, 0) ;
 IVcopy(nfront, temp, nzeros) ;
 IV_setSize(nzerosIV, nnew) ;
 nzeros = IV_entries(nzerosIV) ;
