--- killrpath.c.orig	2026-06-05 00:40:56.177360000 -0400
+++ killrpath.c	2026-06-05 09:08:22.971908000 -0400
@@ -37,9 +37,9 @@
 killrpath(const char *filename)
 {
    int fd;
-   Elf_Ehdr ehdr;
+   ChrpathElf_Ehdr ehdr;
    int i;
-   Elf_Phdr phdr;
+   ChrpathElf_Phdr phdr;
    void *dyns;
    int dynpos;
 
