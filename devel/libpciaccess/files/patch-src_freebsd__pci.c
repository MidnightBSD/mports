--- src/freebsd_pci.c.orig	2026-06-04 09:09:26.435789000 -0400
+++ src/freebsd_pci.c	2026-06-04 09:09:26.558511000 -0400
@@ -399,24 +399,6 @@
     close(freebsd_pci_sys->pcidev);
     free(freebsd_pci_sys->pci_sys.devices);
     freebsd_pci_sys = NULL;
-}
-
-static int
-pci_device_freebsd_has_kernel_driver( struct pci_device *dev )
-{
-    struct pci_io io;
-
-    io.pi_sel.pc_domain = dev->domain;
-    io.pi_sel.pc_bus = dev->bus;
-    io.pi_sel.pc_dev = dev->dev;
-    io.pi_sel.pc_func = dev->func;
-    
-    if ( ioctl( freebsd_pci_sys->pcidev, PCIOCATTACHED, &io ) < 0 ) {
-	return 0;
-    }
-
-    /* if io.pi_data is 0, no driver is attached */
-    return io.pi_data == 0 ? 0 : 1;
 }
 
 static struct pci_io_handle *
@@ -574,7 +556,7 @@
     .enable = NULL,
     .boot_vga = NULL,
     .boot_display = NULL,
-    .has_kernel_driver = pci_device_freebsd_has_kernel_driver,
+    .has_kernel_driver = NULL,
 
     .open_device_io = pci_device_freebsd_open_io,
     .open_legacy_io = pci_device_freebsd_open_legacy_io,
