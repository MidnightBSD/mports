--- drivers/gpu/drm/drm_pci.c.orig	2026-11-10 05:00:00 UTC
+++ drivers/gpu/drm/drm_pci.c
@@ -68,9 +68,19 @@
 {
 	struct pci_dev *pdev = to_pci_dev(dev->dev);
 
-#ifdef __FreeBSD__
+#if defined(__MidnightBSD_version) && __MidnightBSD_version >= 402004
+	/*
+	 * LinuxKPI from FreeBSD stable/15 defines pci_get_slot() as the
+	 * Linux two-argument macro; use the pci_dev fields instead.
+	 */
 	master->unique = kasprintf(GFP_KERNEL, "pci:%04x:%02x:%02x.%d",
 					drm_get_pci_domain(dev),
+					pdev->bus->number,
+					PCI_SLOT(pdev->devfn),
+					PCI_FUNC(pdev->devfn));
+#elif defined(__FreeBSD__)
+	master->unique = kasprintf(GFP_KERNEL, "pci:%04x:%02x:%02x.%d",
+					drm_get_pci_domain(dev),
 					pci_get_bus(dev->dev->bsddev),
 					pci_get_slot(dev->dev->bsddev),
 					PCI_FUNC(pdev->devfn));
@@ -93,7 +103,21 @@
 drm_getpciinfo(struct drm_device *dev, void *data, struct drm_file *file_priv)
 {
 	struct drm_pciinfo *info = data;
+#if defined(__MidnightBSD_version) && __MidnightBSD_version >= 402004
+	struct pci_dev *pdev = to_pci_dev(dev->dev);
+#endif
 
+#if defined(__MidnightBSD_version) && __MidnightBSD_version >= 402004
+	info->domain = pci_domain_nr(pdev->bus);
+	info->bus = pdev->bus->number;
+	info->dev = PCI_SLOT(pdev->devfn);
+	info->func = PCI_FUNC(pdev->devfn);
+	info->vendor_id = pdev->vendor;
+	info->device_id = pdev->device;
+	info->subvendor_id = pdev->subsystem_vendor;
+	info->subdevice_id = pdev->subsystem_device;
+	info->revision_id = pdev->revision;
+#else
 	info->domain = pci_get_domain(dev->dev->bsddev);
 	info->bus = pci_get_bus(dev->dev->bsddev);
 	info->dev = pci_get_slot(dev->dev->bsddev);
@@ -103,6 +127,7 @@
 	info->subvendor_id = pci_get_subvendor(dev->dev->bsddev);
 	info->subdevice_id = pci_get_subdevice(dev->dev->bsddev);
 	info->revision_id = pci_get_revid(dev->dev->bsddev);
+#endif
 
 	return 0;
 }
