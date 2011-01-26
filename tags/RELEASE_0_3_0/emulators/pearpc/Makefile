# New ports collection makefile for:	pearpc
# Date created:				22 May 2004
# Whom:					Roman Bogorodskiy
#
# $MidnightBSD: mports/emulators/pearpc/Makefile,v 1.7 2010/01/02 18:44:38 laffer1 Exp $
# $FreeBSD: ports/emulators/pearpc/Makefile,v 1.22 2006/09/20 11:20:47 stas Exp $
#

PORTNAME=	pearpc
PORTVERSION=	0.4
PORTREVISION=	4
CATEGORIES=	emulators
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}/${PORTVERSION}.0

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	PowerPC emulator
LICENSE=	gpl2

USE_XORG=	x11
GNU_CONFIGURE=	yes
CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd7.0
SUB_FILES=	pkg-message

MAN1=		ppc.1

PLIST_FILES=	bin/ppc etc/ppccfg.example %%DATADIR%%/video.x
PLIST_DIRS=	%%DATADIR%%

.if defined(WITH_OPTIMIZED_CFLAGS)
CFLAGS+=	-O3 -ffast-math
.else
CONFIGURE_ARGS+=	--disable-fpo
.endif

.if defined(WITH_SDL)
CONFIGURE_ARGS+=	--enable-ui=sdl
USE_SDL=	sdl
.else
CONFIGURE_ARGS+=	--enable-ui=x11
.endif

.if defined(WITH_DEBUG)
CONFIGURE_ARGS+=	--enable-debug
.else
CONFIGURE_ARGS+=	--disable-debug
.endif

.include <bsd.port.pre.mk>

# jitc_x86 is avaible only on x86
.if ${ARCH} == "i386"
BUILD_DEPENDS+=	nasm:${PORTSDIR}/devel/nasm
.if !defined(WITH_JITC)
CONFIGURE_ARGS+=	--enable-cpu=generic
.else
CONFIGURE_ARGS+=	--enable-cpu=jitc_x86
.endif # WITH_JITC
.else
CONFIGURE_ARGS+=	--enable-cpu=generic
.endif

pre-everything::
.if !defined(WITH_OPTIMIZED_CFLAGS)
	@${ECHO_MSG} ""
	@${ECHO_MSG} "You can do optimized build defining WITH_OPTIMIZED_CFLAGS=yes."
	@${ECHO_MSG} ""
.endif

post-extract:
	@${REINPLACE_CMD} -e 's|-g -O2||;s|-O2||' ${WRKSRC}/configure

pre-configure:
.if ${OSVERSION} > 3000
	@${REINPLACE_CMD} -e 's|clock_settime\ ()|foobar()|' ${WRKSRC}/configure
.endif

post-configure:
	@${REINPLACE_CMD} -e 's|-lpthread|${PTHREAD_LIBS}|g' ${WRKSRC}/Makefile
	@${REINPLACE_CMD} -e 's|-lpthread|${PTHREAD_LIBS}|g' ${WRKSRC}/src/Makefile

post-install:
	@${MKDIR} ${DATADIR}
	@${INSTALL_DATA} ${WRKSRC}/video.x ${DATADIR}/video.x
	@${INSTALL_DATA} ${WRKSRC}/ppccfg.example ${PREFIX}/etc/ppccfg.example

.include <bsd.port.post.mk>
