# $MidnightBSD$

PORTNAME=	gstreamer1-libav
PORTVERSION=	1.4.5
CATEGORIES=	multimedia
MASTER_SITES=	http://gstreamer.freedesktop.org/src/gst-libav/
DISTNAME=	gst-libav-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GStreamer plug-in with many audio/video decoders/encoders

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	yasm:${PORTSDIR}/devel/yasm \
		orc>=0.4.16:${PORTSDIR}/devel/orc
LIB_DEPENDS=	liborc-0.4.so:${PORTSDIR}/devel/orc

USES=		compiler:features gmake libtool pkgconfig tar:xz
USE_LDCONFIG=	yes
USE_GSTREAMER1=	yes
GNU_CONFIGURE=	yes
LIBAV_CONFIG=	--cc=${CC} \
		--enable-runtime-cpudetect \
		--enable-pic \
		--build=${ARCH}-portbld-freebsd9.1
LDFLAGS+=	-Wl,-Bsymbolic
CONFIGURE_ARGS+=	--build=${ARCH}-portbld-freebsd9.1

INSTALL_TARGET=	install-strip

.include <bsd.port.pre.mk>

.if ${COMPILER_TYPE} == clang && ${ARCH} == i386
CFLAGS+=	-mstack-alignment=16 -mstackrealign
.endif

post-patch:
	@${REINPLACE_CMD} 's/[[:<:]]ARCH[[:>:]]/LIBAV_ARCH/' \
		${WRKSRC}/gst-libs/ext/libav/Makefile \
		${WRKSRC}/gst-libs/ext/libav/common.mak \
		${WRKSRC}/gst-libs/ext/libav/configure \
		${WRKSRC}/gst-libs/ext/libav/libavcodec/Makefile \
		${WRKSRC}/gst-libs/ext/libav/library.mak
	@${REINPLACE_CMD} '/libgstlibav_la_LDFLAGS =/s/$$/ -Wl,-Bsymbolic/' \
		${WRKSRC}/ext/libav/Makefile.in
	${REINPLACE_CMD} 's|freebsd|midnightbsd|g' \
		${WRKSRC}/gst-libs/ext/libav/configure

.include <bsd.port.post.mk>
