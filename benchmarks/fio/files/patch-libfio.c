--- libfio.c.orig	2024-12-17 09:18:11 UTC
+++ libfio.c
@@ -56,6 +56,7 @@ static const char *fio_os_strings[os_nr] = {
 	"Windows",
 	"Android",
 	"DragonFly",
+	"MidnightBSD",
 };
 
 /* see arch/arch.h */
