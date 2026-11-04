PORTREVISION=	0
CATEGORIES=	audio

COMMENT=	GStreamer OpenCore based Adaptive Multi-Rate Narrow-Band plugin

GST_PLUGIN=	amrnb
DIST=		good

MASTERDIR=	${.CURDIR}/../../multimedia/gstreamer1-plugins

PLIST=		${.CURDIR}/pkg-plist

LIB_DEPENDS=	libopencore-amrnb.so:audio/opencore-amr

.include "${MASTERDIR}/Makefile"
