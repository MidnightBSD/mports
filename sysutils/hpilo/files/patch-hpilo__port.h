--- hpilo_port.h.orig
+++ hpilo_port.h
@@ -14,20 +14,7 @@
 #define MODULE_ALIAS(x)
 
 #define MATCH(_id, _dev, _idfld, _devfld) \
 	(_id->_idfld == PCI_ANY_ID || _id->_idfld == _dev->_devfld)
 
-static int
-pci_match_id(const struct pci_device_id *ids, struct pci_dev *dev)
-{
-	for (; ids->vendor; ids++) {
-		if (MATCH(ids, dev, vendor, vendor) &&
-		    MATCH(ids, dev, device, device) &&
-		    MATCH(ids, dev, subvendor, subsystem_vendor) &&
-		    MATCH(ids, dev, subdevice, subsystem_device))
-			return 1;
-	}
-	return 0;
-}
-
 static inline void *
 hpilo_pci_iomap(struct pci_dev *dev, int mmio_bar, int mmio_size __unused)
@@ -45,19 +32,7 @@
 	iounmap(res);
 }
 
-static inline void *
-pci_iomap_range(struct pci_dev *dev, int bar, unsigned long offset,
-		unsigned long maxlen)
-{
-	void *vaddr;
-
-	vaddr = hpilo_pci_iomap(dev, bar, maxlen);
-	if (vaddr)
-		vaddr = (caddr_t)vaddr + offset;
-	return vaddr;
-}
-
 static inline int
 hpilo_make_dev(struct make_dev_args *args, struct cdev *ptr, char *name)
