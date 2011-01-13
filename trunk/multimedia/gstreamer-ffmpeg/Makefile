# $MidnightBSD: mports/multimedia/gstreamer-ffmpeg/Makefile,v 1.4 2010/02/27 22:06:44 laffer1 Exp $

PORTNAME=	gstreamer
PORTVERSION=	0.10.8
CATEGORIES=	multimedia
MASTER_SITES=	http://gstreamer.freedesktop.org/src/gst-ffmpeg/
PKGNAMESUFFIX=	-ffmpeg
DISTNAME=	gst-ffmpeg-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GStreamer plug-in for manipulating MPEG video streams
LICENSE=        gpl2

CFLAGS:=	${CFLAGS} -O2
USE_XLIB=	yes
USE_BZIP2=	yes
USE_GMAKE=	yes
USE_LDCONFIG=	yes
USE_GNOME=	gnometarget gnomelibs
USE_GSTREAMER=	yes
GNU_CONFIGURE=	yes
CONFIGURE_TARGET= --build=${ARCH}-portbld-freebsd6.1 \
	  --host=${ARCH}-portbld-freebsd6.1 \
	  --target=${ARCH}-portbld-freebsd6.1
CONFIGURE_ENV=	PKG_CONFIG=${PKG_CONFIG} \
		CPPFLAGS="${CPPFLAGS} -I${LOCALBASE}/include" \
		CFLAGS="${CFLAGS} -fno-force-addr" \
		LDFLAGS="${LDFLAGS} -L${LOCALBASE}/lib"
PLIST_SUB=	\
		VERSION="${GST_VERSION}"
WITHOUT_CPU_CFLAGS=	yes

PKG_CONFIG?="${LOCALBASE}/bin/pkg-config"
GST_VERSION=${PORTVERSION:C/..$//}

.include <bsd.port.pre.mk>

post-patch:
	@${REINPLACE_CMD} -e \
		's|make|${GMAKE}|' \
		${WRKSRC}/gst-libs/ext/Makefile.in
	${CP} ${FILESDIR}/config.sub ${FILESDIR}/config.guess \
		${WRKSRC}
.include <bsd.port.post.mk>
