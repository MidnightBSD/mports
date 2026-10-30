--- media/base/media_switches.h.orig	2026-10-26 21:13:13 UTC
+++ media/base/media_switches.h
@@ -449,7 +449,7 @@
 MEDIA_EXPORT BASE_DECLARE_FEATURE(kShowForceRespectUiGainsToggle);
 #endif  // BUILDFLAG(IS_CHROMEOS)
 
-#if BUILDFLAG(IS_CHROMEOS) || BUILDFLAG(IS_LINUX)
+#if BUILDFLAG(IS_CHROMEOS) || BUILDFLAG(IS_LINUX) || BUILDFLAG(IS_BSD)
 MEDIA_EXPORT BASE_DECLARE_FEATURE(kReduceHardwareVideoDecoderBuffers);
 MEDIA_EXPORT BASE_DECLARE_FEATURE(kUseOutOfProcessVideoEncoding);
 MEDIA_EXPORT BASE_DECLARE_FEATURE(kV4L2H264TemporalLayerHWEncoding);
@@ -460,7 +460,7 @@
 MEDIA_EXPORT BASE_DECLARE_FEATURE(kFuchsiaMediacodecVideoEncoder);
 #endif  // BUILDFLAG(IS_FUCHSIA)
 
-#if BUILDFLAG(IS_LINUX)
+#if BUILDFLAG(IS_LINUX) || BUILDFLAG(IS_BSD)
 MEDIA_EXPORT BASE_DECLARE_FEATURE(kAcceleratedVideoDecodeLinux);
 MEDIA_EXPORT BASE_DECLARE_FEATURE(kAcceleratedVideoDecodeLinuxGL);
 MEDIA_EXPORT BASE_DECLARE_FEATURE(kAcceleratedVideoEncodeLinux);
@@ -470,6 +470,16 @@
 MEDIA_EXPORT BASE_DECLARE_FEATURE(kPreferV4L2VideoAcceleration);
 MEDIA_EXPORT BASE_DECLARE_FEATURE(kPulseaudioLoopbackForCast);
 MEDIA_EXPORT BASE_DECLARE_FEATURE(kPulseaudioLoopbackForScreenShare);
+
+enum class AudioBackend {
+  kAuto,
+  kPulseAudio,
+  kSndio,
+  kAlsa
+};
+
+MEDIA_EXPORT BASE_DECLARE_FEATURE(kAudioBackend);
+MEDIA_EXPORT extern const base::FeatureParam<AudioBackend> kAudioBackendParam;
 MEDIA_EXPORT BASE_DECLARE_FEATURE(kVaapiIgnoreDriverChecks);
 #endif  // BUILDFLAG(IS_LINUX)
 
