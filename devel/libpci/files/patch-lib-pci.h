--- lib/pci.h.orig	2024-05-30 15:58:10 UTC
+++ lib/pci.h
@@ -12,11 +12,11 @@
 #define _PCI_LIB_H
 
 #ifndef PCI_CONFIG_H
-#include "config.h"
+#include "pci/config.h"
 #endif
 
-#include "header.h"
-#include "types.h"
+#include "pci/header.h"
+#include "pci/types.h"
 
 #define PCI_LIB_VERSION 0x030d00
 
