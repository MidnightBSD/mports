--- chrpath.c.orig	2026-06-05 00:40:56.174419000 -0400
+++ chrpath.c	2026-06-05 09:08:22.966196000 -0400
@@ -60,9 +60,9 @@
  * Reads the section names table from an ELF file into memory
  */
 char*
-read_section_names(int fd, Elf_Ehdr ehdr)
+read_section_names(int fd, ChrpathElf_Ehdr ehdr)
 {
-  Elf_Shdr shdr;
+  ChrpathElf_Shdr shdr;
 
   const size_t sz_shdr = is_e32() ? sizeof(Elf32_Shdr) : sizeof(Elf64_Shdr);
   const size_t sh_off = EHDRWU(e_shoff);
@@ -122,10 +122,10 @@
 chrpath(const char *filename, const char *newpath, int convert)
 {
   int fd;
-  Elf_Ehdr ehdr;
+  ChrpathElf_Ehdr ehdr;
   int i;
-  Elf_Phdr phdr;
-  Elf_Shdr shdr;
+  ChrpathElf_Phdr phdr;
+  ChrpathElf_Shdr shdr;
   void *dyns;
   int rpathoff;
   char * strtab;
