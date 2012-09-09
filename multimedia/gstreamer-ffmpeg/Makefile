# $MidnightBSD: mports/multimedia/gstreamer-ffmpeg/Makefile,v 1.9 2011/12/15 00:57:50 laffer1 Exp $

PORTNAME=	gstreamer
PORTVERSION=	0.10.11
PORTREVISION=	3
CATEGORIES=	multimedia
MASTER_SITES=	http://gstreamer.freedesktop.org/src/gst-ffmpeg/
PKGNAMESUFFIX=	-ffmpeg
DISTNAME=	gst-ffmpeg-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GStreamer plug-in for manipulating MPEG video streams
LICENSE=        gpl2

LIB_DEPENDS=	orc-0.4.11:${PORTSDIR}/devel/orc

CFLAGS:=	${CFLAGS} -O2 -Wno-format
USE_BZIP2=	yes
USE_GMAKE=	yes
USE_LDCONFIG=	yes
USE_GNOME=	gnomelibs
USE_PKGCONFIG=	yes
USE_GSTREAMER=	yes
GNU_CONFIGURE=	yes
CONFIGURE_TARGET= ${ARCH}-portbld-freebsd7.0
CONFIGURE_ENV=	CPPFLAGS="${CPPFLAGS} -I${LOCALBASE}/include" \
		CFLAGS="${CFLAGS} -fno-force-addr" \
		LDFLAGS="${LDFLAGS} -L${LOCALBASE}/lib"
PLIST_SUB=	VERSION="${GST_VERSION}"
WITHOUT_CPU_CFLAGS=	yes

GST_VERSION=${PORTVERSION:C/..$//}

.include <bsd.port.pre.mk>

post-patch:
	${CP} ${FILESDIR}/config.sub ${FILESDIR}/config.guess \
		${WRKSRC}
	@${REINPLACE_CMD} -e \
		's|make|${GMAKE}|' \
		${WRKSRC}/gst-libs/ext/Makefile.in
	@${REINPLACE_CMD} -e 's|/usr/bin|${LOCALBASE}/bin|g'\
		${WRKSRC}/gst-libs/ext/ffmpeg/doc/texi2pod.pl
	@${REINPLACE_CMD} -e 's|-Wmissing-include-dirs||g' \
		${WRKSRC}/configure
	@cd ${WRKSRC}/gst-libs/ext/ffmpeg/libavcodec && \
		${LN} -s x86 i386 && ${LN} -s x86 amd64

.include <bsd.port.post.mk>
