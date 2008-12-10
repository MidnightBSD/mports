--- ../kio/kio/kdirlister.cpp.orig	2008-10-30 14:24:07.000000000 +0100
+++ ../kio/kio/kdirlister.cpp		2008-11-15 16:54:29.000000000 +0100
@@ -1065,7 +1065,8 @@
   // the signals to make sure it exists in KDirListerCache in case someone
   // calls listDir during the signal emission
   Q_ASSERT( dirData.listersCurrentlyHolding.isEmpty() );
-  dirData.moveListersWithoutCachedItemsJob();
+  //dirData.moveListersWithoutCachedItemsJob();
+  moveListersWithoutCachedItemsJob(dirData);
 
   if ( job->error() )
   {
@@ -1437,7 +1438,8 @@
     DirectoryData& dirData = directoryData[jobUrlStr];
     // Collect the dirlisters which were listing the URL using that ListJob
     // plus those that were already holding that URL - they all get updated.
-    dirData.moveListersWithoutCachedItemsJob();
+    //dirData.moveListersWithoutCachedItemsJob();
+    moveListersWithoutCachedItemsJob(dirData);
     QList<KDirLister *> listers = dirData.listersCurrentlyHolding;
     listers += dirData.listersCurrentlyListing;
 
@@ -2514,20 +2516,20 @@
     }
 }
 
-void KDirListerCache::DirectoryData::moveListersWithoutCachedItemsJob()
+void KDirListerCache::moveListersWithoutCachedItemsJob(DirectoryData& dirData)
 {
     // Move dirlisters from listersCurrentlyListing to listersCurrentlyHolding,
     // but not those that are still waiting on a CachedItemsJob...
     // Unit-testing note:
     // Run kdirmodeltest in valgrind to hit the case where an update
     // is triggered while a lister has a CachedItemsJob (different timing...)
-    QMutableListIterator<KDirLister *> lister_it(listersCurrentlyListing);
+    QMutableListIterator<KDirLister *> lister_it(dirData.listersCurrentlyListing);
     while (lister_it.hasNext()) {
         KDirLister* kdl = lister_it.next();
         if (!kdl->d->m_cachedItemsJob) {
-            Q_ASSERT(!listersCurrentlyHolding.contains(kdl));
+            Q_ASSERT(!dirData.listersCurrentlyHolding.contains(kdl));
             // OK, move this lister from "currently listing" to "currently holding".
-            listersCurrentlyHolding.append(kdl);
+            dirData.listersCurrentlyHolding.append(kdl);
             lister_it.remove();
         }
     }
