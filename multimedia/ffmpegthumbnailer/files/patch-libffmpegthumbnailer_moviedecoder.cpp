--- libffmpegthumbnailer/moviedecoder.cpp.orig
+++ libffmpegthumbnailer/moviedecoder.cpp
@@ -41,0 +42,12 @@
+{
+
+static bool isInterlacedFrame(const AVFrame* frame)
+{
+#ifdef AV_FRAME_FLAG_INTERLACED
+    return (frame->flags & AV_FRAME_FLAG_INTERLACED) != 0;
+#else
+    return frame->interlaced_frame != 0;
+#endif
+}
+
+static bool isKeyFrame(const AVFrame* frame)
@@ -42,0 +55,6 @@
+#ifdef AV_FRAME_FLAG_KEY
+    return (frame->flags & AV_FRAME_FLAG_KEY) != 0;
+#else
+    return frame->key_frame != 0;
+#endif
+}
@@ -409 +427 @@
-    if (m_pFrame->interlaced_frame != 0)
+    if (isInterlacedFrame(m_pFrame))
@@ -521 +539 @@
-    } while ((!gotFrame || !m_pFrame->key_frame) && keyFrameAttempts < 200);
+    } while ((!gotFrame || !isKeyFrame(m_pFrame)) && keyFrameAttempts < 200);
@@ -658 +676,13 @@
-    auto matrix = reinterpret_cast<int32_t*>(av_stream_get_side_data(m_pVideoStream, AV_PKT_DATA_DISPLAYMATRIX, nullptr));
+    const uint8_t* matrixData = nullptr;
+#if LIBAVFORMAT_VERSION_MAJOR >= 61
+    const AVPacketSideData* sideData = av_packet_side_data_get(m_pVideoStream->codecpar->coded_side_data,
+                                                               m_pVideoStream->codecpar->nb_coded_side_data,
+                                                               AV_PKT_DATA_DISPLAYMATRIX);
+    if (sideData)
+    {
+        matrixData = sideData->data;
+    }
+#else
+    matrixData = av_stream_get_side_data(m_pVideoStream, AV_PKT_DATA_DISPLAYMATRIX, nullptr);
+#endif
+    auto matrix = reinterpret_cast<const int32_t*>(matrixData);
@@ -680 +709,0 @@
-
