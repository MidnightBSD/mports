# $MidnightBSD: mports/multimedia/gpac-libgpac/Makefile,v 1.7 2010/12/05 21:01:07 laffer1 Exp $
# $FreeBSD: ports/multimedia/gpac-libgpac/Makefile,v 1.13 2006/08/14 23:36:33 ahze Exp $

PORTNAME=	gpac
PORTVERSION=	0.4.5
PORTREVISION=	4
PORTEPOCH=	1
CATEGORIES=	multimedia
MASTER_SITES=	SF/${PORTNAME}/GPAC/GPAC%20${PORTVERSION}
PKGNAMESUFFIX=	-libgpac

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Gpac MPEG-4 Systems library and headers
LICENSE=	lgpl

WRKSRC=		${WRKDIR}/gpac
ALL_TARGET=	lib
USE_GCPIO=	yes
USE_GMAKE=	yes
MAKE_JOBS_SAFE=	yes
HAS_CONFIGURE=	yes
USE_LDCONFIG=	yes

BUILD_WRKSRC=	${WRKSRC}/src
INSTALL_WRKSRC=	${WRKSRC}/bin/gcc
LIBVER=	1

OPTIONS=	IPV6 "IPv6 support"		on \
		JPEG "JPEG support"		on \
		OPENGL "OpenGL support"		on \
		OPENSSL "OpenSSL support"	on \
		PNG "PNG support"		on

CFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

CONFIGURE_ARGS=	--cc="${CC}" --X11-path="${LOCALBASE}" \
		--extra-cflags="${CFLAGS}" --extra-ldflags="${LDFLAGS}" \
		--enable-pic \
		--use-js=no --use-a52=no --use-faad=no --use-ffmpeg=no \
		--use-ft=no --use-mad=no --use-ogg=no \
		--use-openjpeg=no --use-theora=no --usr-vorbis=no

CONFIGURE_ENV+=	LIBVER="${LIBVER}" PTHREAD_LIBS="${PTHREAD_LIBS}"

.include <bsd.port.pre.mk>

.if defined(WITHOUT_IPV6)
CONFIGURE_ARGS+=	--disable-ipv6
.endif

.if !defined(WITHOUT_JPEG)
LIB_DEPENDS+=	jpeg.11:${PORTSDIR}/graphics/jpeg
CONFIGURE_ARGS+=	--use-jpeg=local
.else
CONFIGURE_ARGS+=	--use-jpeg=no
.endif

.if defined(WITHOUT_OPENGL)
CONFIGURE_ARGS+=	--disable-opengl
.else
USE_GL=		gl glu glut
.endif

.if !defined(WITHOUT_OPENSSL)
USE_OPENSSL=	yes
.else
CONFIGURE_ARGS+=	--disable-ssl
.endif

.if !defined(WITHOUT_PNG)
LIB_DEPENDS+=	png15:${PORTSDIR}/graphics/png
CONFIGURE_ARGS+=	--use-png=local
CFLAGS+=		-I${LOCALBASE}/include/libpng15
.else
CONFIGURE_ARGS+=	--use-png=no
.endif

post-patch:
	${CHMOD} +x ${WRKSRC}/configure

do-install:
	${MKDIR} ${PREFIX}/include/gpac
	cd ${WRKSRC}/include/gpac && ${FIND} . | \
		${CPIO} -vpdm -L -R ${LIBOWN}:${LIBGRP} ${PREFIX}/include/gpac
	${INSTALL_DATA} ${INSTALL_WRKSRC}/libgpac.so.${LIBVER} ${PREFIX}/lib
	${LN} -sf libgpac.so.${LIBVER} ${PREFIX}/lib/libgpac.so
	${INSTALL_DATA} ${INSTALL_WRKSRC}/libgpac_static.a ${PREFIX}/lib

.include <bsd.port.post.mk>
