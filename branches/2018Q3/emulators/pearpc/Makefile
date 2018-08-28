# $MidnightBSD$

PORTNAME=	pearpc
PORTVERSION=	0.4
PORTREVISION=	6
CATEGORIES=	emulators
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}/${PORTVERSION}.0

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	PowerPC emulator
LICENSE=	gpl2

USE_XORG=	x11
GNU_CONFIGURE=	yes
SUB_FILES=	pkg-message

USE_GCC=	yes
USE_CXXSTD=	gnu++03

MAN1=		ppc.1

PLIST_FILES=	bin/ppc etc/ppccfg.example %%DATADIR%%/video.x
PLIST_DIRS=	%%DATADIR%%

OPTIONS_DEFINE=	SDL OPTIMIZED_CFLAGS DEBUG
SDL_DESC=	Use SDL for user interface

.include <bsd.port.pre.mk>

.if ${PORT_OPTIONS:MSDL}
CONFIGURE_ARGS+=	--enable-ui=sdl
USE_SDL=	sdl
.else
CONFIGURE_ARGS+=	--enable-ui=x11
.endif

.if ${PORT_OPTIONS:MOPTIMIZED_CFLAGS}
CFLAGS+=	-O3 -ffast-math
.else
CONFIGURE_ARGS+=	--disable-fpo
.endif

.if ${PORT_OPTIONS:MDEBUG}
CONFIGURE_ARGS+=	--enable-profiling	# implies --enable-debug
.endif

.if ${ARCH} == "i386"
BUILD_DEPENDS=	nasm:${PORTSDIR}/devel/nasm
CONFIGURE_ARGS+=	--enable-cpu=jitc_x86
.else
CONFIGURE_ARGS+=	--enable-cpu=generic
.endif

post-extract:
	@${REINPLACE_CMD} -e 's|-g -O2||;s|-O2||' ${WRKSRC}/configure
	@${REINPLACE_CMD} -e 's|PROCESS_CPUTIME|THREAD_CPUTIME|' \
		${WRKSRC}/src/system/osapi/posix/systimer.cc
	@${REINPLACE_CMD} -e 's|video\.x"|${DATADIR}/&|' \
		${WRKSRC}/ppccfg.example

post-install:
	@${MKDIR} ${DATADIR}
	${INSTALL_DATA} ${WRKSRC}/video.x ${DATADIR}
	${INSTALL_DATA} ${WRKSRC}/ppccfg.example ${PREFIX}/etc

.include <bsd.port.post.mk>
