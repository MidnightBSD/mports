--- src/audio/ffmpeg_audio_reader.h.orig
+++ src/audio/ffmpeg_audio_reader.h
@@ -220,8 +220,7 @@ inline void FFmpegAudioReader::Close() {
 	m_stream_index = -1;

 	if (m_codec_ctx) {
-		avcodec_close(m_codec_ctx);
-		m_codec_ctx = nullptr;
+		avcodec_free_context(&m_codec_ctx);
 	}

 	if (m_format_ctx) {
