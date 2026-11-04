--- Source/WebCore/platform/graphics/gbm/MemoryMappedGPUBuffer.cpp.orig
+++ Source/WebCore/platform/graphics/gbm/MemoryMappedGPUBuffer.cpp
@@ -36,7 +36,20 @@
 #include "VivanteSuperTiledTextureInlines.h"
 #include <epoxy/egl.h>
 #include <fcntl.h>
+#if OS(LINUX)
 #include <linux/dma-buf.h>
+#else
+struct dma_buf_sync {
+    uint64_t flags;
+};
+
+#define DMA_BUF_SYNC_READ (1 << 0)
+#define DMA_BUF_SYNC_WRITE (1 << 1)
+#define DMA_BUF_SYNC_START (0 << 2)
+#define DMA_BUF_SYNC_END (1 << 2)
+#define DMA_BUF_BASE 'b'
+#define DMA_BUF_IOCTL_SYNC _IOW(DMA_BUF_BASE, 0, struct dma_buf_sync)
+#endif
 #include <sys/ioctl.h>
 #include <sys/mman.h>
 #include <wtf/SafeStrerror.h>
