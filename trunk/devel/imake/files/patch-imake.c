--- imake.c.orig	2013-08-17 06:11:50.000000000 -0400
+++ imake.c	2015-09-08 21:46:29.953635469 -0400
@@ -146,7 +146,7 @@
 
 #include "config.h"
 
-#if defined(__FreeBSD__) || defined(__NetBSD__) || defined(__DragonFly__)
+#if defined(__MidnightBSD__) || defined(__FreeBSD__) || defined(__NetBSD__) || defined(__DragonFly__)
 /* This needs to be before _POSIX_SOURCE gets defined */
 # include <sys/param.h>
 # include <sys/types.h>
@@ -531,6 +531,14 @@
 				AddCppArg(p);
 			}
 	}
+	if ((p = getenv("IMAKECPPFLAGS"))) {
+		AddCppArg(p);
+		for (; *p; p++)
+			if (*p == ' ') {
+				*p++ = '\0';
+				AddCppArg(p);
+			}
+	}
 	if ((p = getenv("IMAKECPP")))
 		cpp = p;
 	if ((p = getenv("IMAKEMAKE")))
@@ -1135,36 +1143,11 @@
 }
 #endif
 
-#if defined __FreeBSD__
+#if defined(__FreeBSD__) || defined(__MidnightBSD__)
 static void
 get_binary_format(FILE *inFile)
 {
-  int mib[2];
-  size_t len;
-  int osrel = 0;
-  FILE *objprog = NULL;
-  int iself = 0;
-  char buf[10];
-  char cmd[PATH_MAX];
-
-  mib[0] = CTL_KERN;
-  mib[1] = KERN_OSRELDATE;
-  len = sizeof(osrel);
-  sysctl(mib, 2, &osrel, &len, NULL, 0);
-  if (CrossCompiling) {
-      strcpy (cmd, CrossCompileDir);
-      strcat (cmd, "/");
-      strcat (cmd,"objformat");
-  } else
-      strcpy (cmd, "objformat");
-
-  if (osrel >= 300004 &&
-      (objprog = popen(cmd, "r")) != NULL &&
-      fgets(buf, sizeof(buf), objprog) != NULL &&
-      strncmp(buf, "elf", 3) == 0)
-    iself = 1;
-  if (objprog)
-    pclose(objprog);
+  int  iself = 1;
 
   fprintf(inFile, "#define DefaultToElfFormat %s\n", iself ? "YES" : "NO");
 }
@@ -1342,7 +1325,8 @@
 #if defined(linux) || \
      defined(__NetBSD__) || \
      defined(__OpenBSD__) || \
-     defined(__FreeBSD__) || \
+     defined(__FreeBSD__) || \ 
+     defined(__MidnightBSD__) || \
      defined(__DragonFly__) || \
      defined(__APPLE__) || \
      defined(__CYGWIN__) || \
@@ -1450,7 +1434,7 @@
 	  name = &uts_name;
       }
 #  endif
-#  ifdef __FreeBSD__
+#  if defined(__FreeBSD__) || defined(__MidnightBSD__)
        /* Override for compiling in chroot of other OS version, such as
         * in the bento build cluster.
         */
