--- elf.c.orig	2026-06-05 00:40:56.175905000 -0400
+++ elf.c	2026-06-05 09:08:22.968813000 -0400
@@ -48,7 +48,7 @@
 }
 
 int
-elf_open(const char *filename, int flags, Elf_Ehdr *ehdr)
+elf_open(const char *filename, int flags, ChrpathElf_Ehdr *ehdr)
 {
    int fd;
    size_t sz_ehdr;
@@ -105,7 +105,7 @@
 }
 
 int
-elf_find_dynamic_section(int fd, Elf_Ehdr *ehdr, Elf_Phdr *phdr)
+elf_find_dynamic_section(int fd, ChrpathElf_Ehdr *ehdr, ChrpathElf_Phdr *phdr)
 {
   int i;
   if (lseek(fd, EHDR_PWU(e_phoff), SEEK_SET) == -1)
