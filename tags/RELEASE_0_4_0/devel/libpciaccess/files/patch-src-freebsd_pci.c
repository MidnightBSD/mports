--- src/freebsd_pci.c.orig	2012-04-09 13:02:57.000000000 -0400
+++ src/freebsd_pci.c	2013-04-16 02:19:10.000000000 -0400
@@ -1,6 +1,8 @@
 /*
  * (C) Copyright Eric Anholt 2006
  * (C) Copyright IBM Corporation 2006
+ * (C) Copyright Mark Kettenis 2011
+ * (C) Copyright Robert Millan 2012
  * All Rights Reserved.
  *
  * Permission is hereby granted, free of charge, to any person obtaining a
@@ -561,6 +563,138 @@
     freebsd_pci_sys = NULL;
 }
 
+#if defined(__i386__) || defined(__amd64__)
+#include <machine/cpufunc.h>
+#endif
+
+static struct pci_io_handle *
+pci_device_freebsd_open_legacy_io(struct pci_io_handle *ret,
+    struct pci_device *dev, pciaddr_t base, pciaddr_t size)
+{
+#if defined(__i386__) || defined(__amd64__)
+	ret->fd = open("/dev/io", O_RDWR | O_CLOEXEC);
+
+	if (ret->fd < 0)
+		return NULL;
+
+	ret->base = base;
+	ret->size = size;
+	return ret;
+#elif defined(PCI_MAGIC_IO_RANGE)
+	ret->memory = mmap(NULL, size, PROT_READ | PROT_WRITE, MAP_SHARED,
+	    aperturefd, PCI_MAGIC_IO_RANGE + base);
+	if (ret->memory == MAP_FAILED)
+		return NULL;
+
+	ret->base = base;
+	ret->size = size;
+	return ret;
+#else
+	return NULL;
+#endif
+}
+
+#if defined(__i386__) || defined(__amd64__)
+static void
+pci_device_freebsd_close_io(struct pci_device *dev, struct pci_io_handle *handle)
+{
+	if (handle->fd > -1)
+		close(handle->fd);
+}
+#endif
+
+static uint32_t
+pci_device_freebsd_read32(struct pci_io_handle *handle, uint32_t reg)
+{
+#if defined(__i386__) || defined(__amd64__)
+	return inl(handle->base + reg);
+#else
+	return *(uint32_t *)((uintptr_t)handle->memory + reg);
+#endif
+}
+
+static uint16_t
+pci_device_freebsd_read16(struct pci_io_handle *handle, uint32_t reg)
+{
+#if defined(__i386__) || defined(__amd64__)
+	return inw(handle->base + reg);
+#else
+	return *(uint16_t *)((uintptr_t)handle->memory + reg);
+#endif
+}
+
+static uint8_t
+pci_device_freebsd_read8(struct pci_io_handle *handle, uint32_t reg)
+{
+#if defined(__i386__) || defined(__amd64__)
+	return inb(handle->base + reg);
+#else
+	return *(uint8_t *)((uintptr_t)handle->memory + reg);
+#endif
+}
+
+static void
+pci_device_freebsd_write32(struct pci_io_handle *handle, uint32_t reg,
+    uint32_t data)
+{
+#if defined(__i386__) || defined(__amd64__)
+	outl(handle->base + reg, data);
+#else
+	*(uint16_t *)((uintptr_t)handle->memory + reg) = data;
+#endif
+}
+
+static void
+pci_device_freebsd_write16(struct pci_io_handle *handle, uint32_t reg,
+    uint16_t data)
+{
+#if defined(__i386__) || defined(__amd64__)
+	outw(handle->base + reg, data);
+#else
+	*(uint8_t *)((uintptr_t)handle->memory + reg) = data;
+#endif
+}
+
+static void
+pci_device_freebsd_write8(struct pci_io_handle *handle, uint32_t reg,
+    uint8_t data)
+{
+#if defined(__i386__) || defined(__amd64__)
+	outb(handle->base + reg, data);
+#else
+	*(uint32_t *)((uintptr_t)handle->memory + reg) = data;
+#endif
+}
+
+static int
+pci_device_freebsd_map_legacy(struct pci_device *dev, pciaddr_t base,
+    pciaddr_t size, unsigned map_flags, void **addr)
+{
+	struct pci_device_mapping map;
+	int err;
+
+	map.base = base;
+	map.size = size;
+	map.flags = map_flags;
+	map.memory = NULL;
+	err = pci_device_freebsd_map_range(dev, &map);
+	*addr = map.memory;
+
+	return err;
+}
+
+static int
+pci_device_freebsd_unmap_legacy(struct pci_device *dev, void *addr,
+    pciaddr_t size)
+{
+	struct pci_device_mapping map;
+
+	map.memory = addr;
+	map.size = size;
+	map.flags = 0;
+	return pci_device_freebsd_unmap_range(dev, &map);
+}
+
 static const struct pci_system_methods freebsd_pci_methods = {
     .destroy = pci_system_freebsd_destroy,
     .destroy_device = NULL, /* nothing to do for this */
@@ -571,6 +705,18 @@
     .read = pci_device_freebsd_read,
     .write = pci_device_freebsd_write,
     .fill_capabilities = pci_fill_capabilities_generic,
+    .open_legacy_io = pci_device_freebsd_open_legacy_io,
+#if defined(__i386__) || defined(__amd64__)
+    .close_io = pci_device_freebsd_close_io,
+#endif
+    .read32 = pci_device_freebsd_read32,
+    .read16 = pci_device_freebsd_read16,
+    .read8 = pci_device_freebsd_read8,
+    .write32 = pci_device_freebsd_write32,
+    .write16 = pci_device_freebsd_write16,
+    .write8 = pci_device_freebsd_write8,
+    .map_legacy = pci_device_freebsd_map_legacy,
+    .unmap_legacy = pci_device_freebsd_unmap_legacy,
 };
 
 /**
