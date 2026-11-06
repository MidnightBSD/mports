PORTREVISION=	1
CATEGORIES=	multimedia

COMMENT=	GStreamer WebRTC plugin

LICENSE=	lgpl

LIB_DEPENDS=	libnice.so:net-im/libnice
RUN_DEPENDS=	libnice-gst1>=0:net-im/libnice-gst1

USE_GSTREAMER=	dtls sctp srtp

MASTERDIR=	${.CURDIR:H:H}/multimedia/gstreamer1-plugins

PLIST=		${.CURDIR}/pkg-plist

DIST=		bad
GST_PLUGIN=	webrtc

.include "${MASTERDIR}/Makefile"
