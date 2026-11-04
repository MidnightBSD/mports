--- lib/physmem-posix.c.orig	2025-01-24 14:18:08 UTC
+++ lib/physmem-posix.c
@@ -54,7 +54,7 @@ physmem_open(struct pci_access *a, int w)
   struct physmem *physmem = pci_malloc(a, sizeof(struct physmem));
 
   a->debug("trying to open physical memory device %s in %s mode...", devmem, w ? "read/write" : "read-only");
-  physmem->fd = open(devmem, (w ? O_RDWR : O_RDONLY) | O_DSYNC); /* O_DSYNC bypass CPU cache for mmap() on Linux */
+  physmem->fd = open(devmem, (w ? O_RDWR : O_RDONLY) | O_SYNC); /* O_DSYNC bypass CPU cache for mmap() on Linux */
   if (physmem->fd < 0)
     {
       pci_mfree(physmem);
