--- Source/WebCore/platform/graphics/gbm/MemoryMappedGPUBuffer.cpp.orig
+++ Source/WebCore/platform/graphics/gbm/MemoryMappedGPUBuffer.cpp
@@ -38,1 +38,14 @@
-#include <linux/dma-buf.h>
+#if OS(LINUX)
+#include <linux/dma-buf.h>
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
