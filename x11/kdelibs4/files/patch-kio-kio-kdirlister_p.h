--- ../kio/kio/kdirlister_p.h	2008-10-30 14:24:07.000000000 +0100
+++ ../kio/kio/kdirlister_p.h	2008-11-15 16:54:35.000000000 +0100
@@ -382,8 +382,8 @@
         // Listers that are currently holding this url
         QList<KDirLister *> listersCurrentlyHolding;
 
-        void moveListersWithoutCachedItemsJob();
     };
+    void moveListersWithoutCachedItemsJob(DirectoryData&);
 
     typedef QHash<QString /*url*/, DirectoryData> DirectoryDataHash;
     DirectoryDataHash directoryData;
