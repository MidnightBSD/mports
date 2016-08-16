# $MidnightBSD$

PORTNAME=	gstreamer
PORTVERSION=	0.10.11
PORTREVISION=	7
CATEGORIES=	multimedia
MASTER_SITES=	http://gstreamer.freedesktop.org/src/gst-ffmpeg/
PKGNAMESUFFIX=	-ffmpeg
DISTNAME=	gst-ffmpeg-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GStreamer plug-in for manipulating MPEG video streams

LICENSE=        gpl2

LIB_DEPENDS=	liborc-0.4.so:${PORTSDIR}/devel/orc

CFLAGS:=	${CFLAGS} -O2 -Wno-format
USES=		gmake pkgconfig tar:bzip2
USE_GCC=	any
USE_LDCONFIG=	yes
USE_GSTREAMER=	yes
GNU_CONFIGURE=	yes
CONFIGURE_TARGET= ${ARCH}-portbld-freebsd9.1
FFMPEG_CONFIG=        --cc=${CC} \
              --enable-runtime-cpudetect \
              --enable-pic
LDFLAGS+=     -Wl,-Bsymbolic
CFLAGS+=      -fno-force-addr
PLIST_SUB=	VERSION="${GST_VERSION}"
WITHOUT_CPU_CFLAGS=	yes

GST_VERSION=${PORTVERSION:C/..$//}

.include <bsd.port.pre.mk>

CONFIGURE_ARGS+=      --with-ffmpeg-extra-configure="${FFMPEG_CONFIG}"

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

.if ${OSVERSION} < 4015
BUILD_DEPENDS+=	${LOCALBASE}/bin/as:${PORTSDIR}/devel/binutils
MAKE_ENV+=	COMPILER_PATH=${LOCALBASE}/bin
.endif
.include <bsd.port.post.mk>
