PORTREVISION=	0
CATEGORIES=	audio

COMMENT=	GStreamer WebRTC Audio Processing plugin

GST_PLUGIN=	webrtcdsp
DIST=		bad

USES+=		compiler:c++11-lang

MASTERDIR=	${.CURDIR}/../../multimedia/gstreamer1-plugins

PLIST=		${.CURDIR}/pkg-plist

LIB_DEPENDS=	libwebrtc-audio-processing-1.so:audio/webrtc-audio-processing

.include "${MASTERDIR}/Makefile"
