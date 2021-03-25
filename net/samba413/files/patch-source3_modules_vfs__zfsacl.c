--- source3/modules/vfs_zfsacl.c.orig	2021-03-25 16:38:15.416131000 -0400
+++ source3/modules/vfs_zfsacl.c	2021-03-25 16:40:23.276005000 -0400
@@ -94,6 +94,7 @@
 		aceprop.aceMask  = (uint32_t) acebuf[i].a_access_mask;
 		aceprop.who.id   = (uint32_t) acebuf[i].a_who;
 
+#ifdef ACE_INHERITED_ACE
 		if (config->zfsacl_block_special &&
 		    (aceprop.aceMask == 0) &&
 		    (aceprop.aceFlags & ACE_EVERYONE) &&
@@ -101,6 +102,7 @@
 		{
 			continue;
 		}
+#endif
 		/*
 		 * Windows clients expect SYNC on acls to correctly allow
 		 * rename, cf bug #7909. But not on DENY ace entries, cf bug
@@ -219,10 +221,16 @@
 	}
 	if (must_add_empty_ace) {
 		acebuf[i].a_type = SMB_ACE4_ACCESS_ALLOWED_ACE_TYPE;
+#ifdef ACE_INHERITED_ACE
 		acebuf[i].a_flags = SMB_ACE4_DIRECTORY_INHERIT_ACE |
 			SMB_ACE4_FILE_INHERIT_ACE |
 			ACE_EVERYONE |
 			ACE_INHERITED_ACE;
+#else
+                acebuf[i].a_flags = SMB_ACE4_DIRECTORY_INHERIT_ACE |
+                        SMB_ACE4_FILE_INHERIT_ACE |
+                        ACE_EVERYONE;
+#endif
 		acebuf[i].a_access_mask = 0;
 		i++;
 	}
