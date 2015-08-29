# $FreeBSD: head/graphics/gstreamer1-plugins-gl/Makefile 393429 2015-08-02 15:03:19Z tijl $

PORTREVISION=	1
CATEGORIES=	graphics

COMMENT=	Gstreamer GL graphics plugin

GST_PLUGIN=	gl
DIST=		bad

PLIST=		${.CURDIR}/pkg-plist

MASTERDIR=	${.CURDIR}/../../multimedia/gstreamer1-plugins

pre-build:
	@cd ${WRKSRC}/gst-libs/gst/gl && ${GMAKE}

post-install:
	@cd ${WRKSRC}/gst-libs/gst/gl && ${SETENV} DESTDIR=${STAGEDIR} \
		INSTALL_TARGET=${INSTALL_TARGET} ${GMAKE} install

.include "${MASTERDIR}/Makefile"
