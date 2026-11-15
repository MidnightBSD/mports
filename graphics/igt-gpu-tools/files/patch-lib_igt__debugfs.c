--- lib/igt_debugfs.c.orig	2022-08-31 20:00:01 UTC
+++ lib/igt_debugfs.c
@@ -25,7 +25,9 @@
 #include <inttypes.h>
 #include <sys/stat.h>
 #include <sys/mount.h>
+#ifdef __linux__
 #include <sys/sysmacros.h>
+#endif
 #include <dirent.h>
 #include <errno.h>
 #include <stdio.h>
@@ -42,6 +44,27 @@
 #include "igt_kms.h"
 #include "igt_debugfs.h"
 #include "igt_sysfs.h"
+
+#ifdef __FreeBSD__
+#define	mount(src, dest, fstype, flags, data)	mount(fstype, dest, flags, data)
+
+/*
+ * devfs device numbers are not DRM minors.  The DRM nodes are /dev/drm/<n>,
+ * where <n> is the DRM minor used in debugfs.
+ */
+static int bsd_drm_minor(int device, const struct stat *st)
+{
+	char name[64];
+	int idx;
+
+	if (device == -1)
+		return 0;
+	if (fdevname_r(device, name, sizeof(name)) != NULL &&
+	    sscanf(name, "drm/%d", &idx) == 1)
+		return idx;
+	return minor(st->st_rdev);
+}
+#endif
 
 /**
  * SECTION:igt_debugfs
@@ -116,8 +139,15 @@
 	if (is_mountpoint("/debug"))
 		return "/debug";
 
+#ifdef __FreeBSD__
+	/* The file system was called lindebugfs before FreeBSD 14. */
+	if (mount("debug", "/sys/kernel/debug", "debugfs", 0, 0) &&
+	    mount("debug", "/sys/kernel/debug", "lindebugfs", 0, 0))
+		return NULL;
+#else
 	if (mount("debug", "/sys/kernel/debug", "debugfs", 0, 0))
 		return NULL;
+#endif
 
 	return "/sys/kernel/debug";
 }
@@ -174,7 +204,11 @@
 		}
 	}
 
+#ifdef __FreeBSD__
+	idx = bsd_drm_minor(device, &st);
+#else
 	idx = minor(st.st_rdev);
+#endif
 	snprintf(path, pathlen, "%s/dri/%d/name", debugfs_root, idx);
 	if (stat(path, &st))
 		return NULL;
