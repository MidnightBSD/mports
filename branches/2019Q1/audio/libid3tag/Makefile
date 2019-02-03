# $MidnightBSD$
# $FreeBSD: ports/audio/libid3tag/Makefile,v 1.9 2006/02/23 10:34:33 ade Exp $

PORTNAME=	libid3tag
PORTVERSION=	0.15.1b
PORTREVISION=	2
CATEGORIES=	audio
MASTER_SITES=	SF/mad/${PORTNAME}/${PORTVERSION} \
		ftp://ftp.mars.org/pub/mpeg/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	ID3 tags library (part of MAD project)

LICENSE=	gpl2 gpl3
LICENSE_COMB=	dual

GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
USES=		libtool pkgconfig

post-build:
	cd ${WRKSRC} && CONFIG_FILES=id3tag.pc CONFIG_HEADERS= ${SH} ./config.status

post-install:
	${MKDIR} ${PREFIX}/libdata/pkgconfig
	${INSTALL_DATA} ${WRKSRC}/id3tag.pc ${PREFIX}/libdata/pkgconfig

.include <bsd.port.mk>
