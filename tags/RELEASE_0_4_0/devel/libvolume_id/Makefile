# $MidnightBSD: mports/devel/libvolume_id/Makefile,v 1.5 2011/09/22 23:05:23 laffer1 Exp $

PORTNAME=	libvolume_id
PORTVERSION=	0.81.1
PORTREVISION=	1
CATEGORIES=	devel
MASTER_SITES=	http://www.marcuscom.com/downloads/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library to provide file system type information
LICENSE=	gpl2

USE_BZIP2=	yes
USE_GMAKE=	yes
USE_LDCONFIG=	yes
USE_PKGCONFIG=	yes
MAKE_ENV=	E=${ECHO_MSG} RANLIB=${RANLIB} AR=${AR} Q=@ \
		prefix=${PREFIX}

PLIST_FILES=	include/libvolume_id.h \
		lib/libvolume_id.a \
		lib/libvolume_id.so \
		lib/libvolume_id.so.0 \
		libdata/pkgconfig/libvolume_id.pc

.include <bsd.port.pre.mk>

do-install:
	${MKDIR} ${PREFIX}/libdata/pkgconfig
	${INSTALL_DATA} ${WRKSRC}/libvolume_id.pc ${PREFIX}/libdata/pkgconfig/libvolume_id.pc
	${INSTALL_DATA} ${WRKSRC}/libvolume_id.h ${PREFIX}/include/libvolume_id.h
	${INSTALL_DATA} ${WRKSRC}/libvolume_id.a ${PREFIX}/lib/libvolume_id.a
	${INSTALL_PROGRAM} ${WRKSRC}/libvolume_id.so.0 ${PREFIX}/lib/libvolume_id.so.0
	${LN} -sf ${PREFIX}/lib/libvolume_id.so.0 ${PREFIX}/lib/libvolume_id.so

.include <bsd.port.post.mk>
