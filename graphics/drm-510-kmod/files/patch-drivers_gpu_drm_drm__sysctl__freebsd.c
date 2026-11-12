--- drivers/gpu/drm/drm_sysctl_freebsd.c.orig	2026-11-10 05:00:00 UTC
+++ drivers/gpu/drm/drm_sysctl_freebsd.c
@@ -171,14 +171,29 @@
     struct sysctl_oid *top)
 {
 	struct sysctl_oid *oid;
+#if defined(__MidnightBSD_version) && __MidnightBSD_version >= 402004
+	struct pci_dev *pdev = dev->pdev;
+#else
 	device_t bsddev;
+#endif
 	int domain, bus, slot, func;
 
+#if defined(__MidnightBSD_version) && __MidnightBSD_version >= 402004
+	/*
+	 * LinuxKPI from FreeBSD stable/15 defines pci_get_slot() as the
+	 * Linux two-argument macro; use the pci_dev fields instead.
+	 */
+	domain = pci_domain_nr(pdev->bus);
+	bus    = pdev->bus->number;
+	slot   = PCI_SLOT(pdev->devfn);
+	func   = PCI_FUNC(pdev->devfn);
+#else
 	bsddev = dev->dev->bsddev;
 	domain = pci_get_domain(bsddev);
 	bus    = pci_get_bus(bsddev);
 	slot   = pci_get_slot(bsddev);
 	func   = pci_get_function(bsddev);
+#endif
 
 	snprintf(dev->busid_str, sizeof(dev->busid_str),
 	    "pci:%04x:%02x:%02x.%d", domain, bus, slot, func);
