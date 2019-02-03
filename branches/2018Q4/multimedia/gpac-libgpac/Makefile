# $MidnightBSD$
# $FreeBSD: ports/multimedia/gpac-libgpac/Makefile,v 1.13 2006/08/14 23:36:33 ahze Exp $

PORTNAME=	gpac
PORTVERSION=	0.4.5
PORTREVISION=	7
PORTEPOCH=	1
CATEGORIES=	multimedia
MASTER_SITES=	SF/${PORTNAME}/GPAC/GPAC%20${PORTVERSION}
PKGNAMESUFFIX=	-libgpac

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Gpac MPEG-4 Systems library and headers

LICENSE=	lgpl

WRKSRC=		${WRKDIR}/gpac
ALL_TARGET=	lib
USE_GMAKE=	yes
HAS_CONFIGURE=	yes
USE_LDCONFIG=	yes

BUILD_WRKSRC=	${WRKSRC}/src
INSTALL_WRKSRC=	${WRKSRC}/bin/gcc
LIBVER=	1

OPTIONS_DEFINE=	IPV6 JPEG OPENGL SSL PNG XVIDEO
OPTIONS_DEFAULT=	IPV6 JPEG SSL

CFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

CONFIGURE_ARGS=	--cc="${CC}" --X11-path="${LOCALBASE}" \
		--extra-cflags="${CFLAGS}" --extra-ldflags="${LDFLAGS}" \
		--enable-pic \
		--disable-wx \
		--use-js=no --use-a52=no --use-faad=no --use-ffmpeg=no \
		--use-ft=no --use-mad=no --use-ogg=no \
		--use-openjpeg=no --use-theora=no --usr-vorbis=no

CONFIGURE_ENV+=	LIBVER="${LIBVER}" PTHREAD_LIBS="${PTHREAD_LIBS}"

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MSSL}
EXTENSIONS+=    ssl
.else
CONFIGURE_ARGS+=	--disable-ssl
.endif

.if ${PORT_OPTIONS:MOPENGL}
USE_GL=		gl glu
.else
CONFIGURE_ARGS+=	--disable-opengl
.endif

.if ${PORT_OPTIONS:MXVIDEO}
LIB_DEPENDS+=	libXv.so:${PORTSDIR}/x11/libXv
.else
CONFIGURE_ARGS+=	--disable-x11-xv --disable-x11-shm
.endif

.include <bsd.port.pre.mk>

.if empty(PORT_OPTIONS:MIPV6)
CONFIGURE_ARGS+=	--disable-ipv6
.endif

.if ${PORT_OPTIONS:MJPEG}
LIB_DEPENDS+=	libjpeg.so:${PORTSDIR}/graphics/jpeg
CONFIGURE_ARGS+=	--use-jpeg=local
.else
CONFIGURE_ARGS+=	--use-jpeg=no
.endif

.if ${PORT_OPTIONS:MPNG}
BROKEN=		png update broke the build, need to update gpac
LIB_DEPENDS+=	libpng.so:${PORTSDIR}/graphics/png
CONFIGURE_ARGS+=	--use-png=local
.else
CONFIGURE_ARGS+=	--use-png=no
.endif

post-patch:
	${CHMOD} +x ${WRKSRC}/configure

do-install:
	${MKDIR} ${PREFIX}/include/gpac
	cd ${WRKSRC}/include/gpac && ${FIND} . | \
		${CPIO} -vpdm -L -R ${LIBOWN}:${LIBGRP} ${PREFIX}/include/gpac
	${INSTALL_DATA} ${INSTALL_WRKSRC}/libgpac.so ${PREFIX}/lib
	${LN} -sf libgpac.so ${PREFIX}/lib/libgpac.so.${LIBVER}
	${INSTALL_DATA} ${INSTALL_WRKSRC}/libgpac_static.a ${PREFIX}/lib

.include <bsd.port.post.mk>
