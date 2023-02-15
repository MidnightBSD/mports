--- libclamav/hfsplus.c.orig	2022-07-26 02:15:53 UTC
+++ libclamav/hfsplus.c
@@ -54,7 +54,8 @@ static cl_error_t hfsplus_scanfile(cli_c
                                    hfsPlusForkData *, const char *, char **, char *);
 static int hfsplus_validate_catalog(cli_ctx *, hfsPlusVolumeHeader *, hfsHeaderRecord *);
 static int hfsplus_fetch_node(cli_ctx *, hfsPlusVolumeHeader *, hfsHeaderRecord *,
-                              hfsHeaderRecord *, hfsPlusForkData *, uint32_t, uint8_t *);
+                              hfsHeaderRecord *, hfsPlusForkData *, uint32_t, uint8_t *,
+                              size_t);
 static cl_error_t hfsplus_walk_catalog(cli_ctx *, hfsPlusVolumeHeader *, hfsHeaderRecord *,
                                        hfsHeaderRecord *, hfsHeaderRecord *, const char *);
 
@@ -521,7 +522,7 @@ static cl_error_t hfsplus_check_attribut
         }
 
         /* fetch node into buffer */
-        ret = hfsplus_fetch_node(ctx, volHeader, attrHeader, NULL, &(volHeader->attributesFile), thisNode, nodeBuf);
+        ret = hfsplus_fetch_node(ctx, volHeader, attrHeader, NULL, &(volHeader->attributesFile), thisNode, nodeBuf, nodeSize);
         if (ret != CL_CLEAN) {
             cli_dbgmsg("hfsplus_check_attribute: node fetch failed.\n");
             break;
@@ -629,7 +630,8 @@ static cl_error_t hfsplus_check_attribut
 
 /* Fetch a node's contents into the buffer */
 static int hfsplus_fetch_node(cli_ctx *ctx, hfsPlusVolumeHeader *volHeader, hfsHeaderRecord *catHeader,
-                              hfsHeaderRecord *extHeader, hfsPlusForkData *catFork, uint32_t node, uint8_t *buff)
+                              hfsHeaderRecord *extHeader, hfsPlusForkData *catFork, uint32_t node, uint8_t *buff,
+                              size_t buffSize)
 {
     int foundBlock = 0;
     uint64_t catalogOffset;
@@ -714,6 +716,11 @@ static int hfsplus_fetch_node(cli_ctx *c
             readSize = endSize;
         }
 
+        if ((buffOffset + readSize) > buffSize) {
+            cli_dbgmsg("hfsplus_fetch_node: Not enough space for read\n");
+            return CL_EFORMAT;
+        }
+
         if (fmap_readn(ctx->fmap, buff + buffOffset, fileOffset, readSize) != readSize) {
             cli_dbgmsg("hfsplus_fetch_node: not all bytes read\n");
             return CL_EFORMAT;
@@ -911,7 +918,7 @@ static cl_error_t hfsplus_walk_catalog(c
         }
 
         /* fetch node into buffer */
-        ret = hfsplus_fetch_node(ctx, volHeader, catHeader, extHeader, &(volHeader->catalogFile), thisNode, nodeBuf);
+        ret = hfsplus_fetch_node(ctx, volHeader, catHeader, extHeader, &(volHeader->catalogFile), thisNode, nodeBuf, nodeSize);
         if (ret != CL_SUCCESS) {
             cli_dbgmsg("hfsplus_walk_catalog: node fetch failed.\n");
             break;
