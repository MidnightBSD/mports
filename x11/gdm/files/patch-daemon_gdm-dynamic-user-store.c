--- daemon/gdm-dynamic-user-store.c.orig
+++ daemon/gdm-dynamic-user-store.c
@@ -22,2 +22,4 @@
 #include <grp.h>
+#ifdef HAVE_USERDB
 #include <shadow.h>
+#endif
@@ -161,3 +163,4 @@
 G_DEFINE_AUTOPTR_CLEANUP_FUNC (WorkerContext, worker_context_free)
 
 typedef gboolean PwdLock;
+#ifdef HAVE_USERDB
@@ -184,1 +187,6 @@
 G_DEFINE_AUTO_CLEANUP_FREE_FUNC (PwdLock, unlock_pwd_db, FALSE)
+#else
+static PwdLock lock_pwd_db (void) { return FALSE; }
+static void unlock_pwd_db (PwdLock lock) { (void) lock; }
+G_DEFINE_AUTO_CLEANUP_FREE_FUNC (PwdLock, unlock_pwd_db, FALSE)
+#endif
