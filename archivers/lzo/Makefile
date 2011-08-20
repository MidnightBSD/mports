# $MidnightBSD: mports/archivers/lzo/Makefile,v 1.5 2011/02/02 20:03:21 laffer1 Exp $

PORTNAME=	lzo
PORTVERSION=	1.08
PORTREVISION=	2
PORTEPOCH=	1
CATEGORIES=	archivers devel
MASTER_SITES=	http://www.oberhumer.com/opensource/lzo/download/LZO-v1/
MASTER_SITE_SUBDIR=	libs/compression

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Portable speedy, lossless data compression library
LICENSE=	gpl2

USE_AUTOTOOLS=	libtool
GNU_CONFIGURE=  yes
CONFIGURE_TARGET=	${ARCH}-portbld-freebsd7.0
CONFIGURE_ARGS=	--enable-shared
USE_LDCONFIG=	yes

post-install:
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA}	${WRKSRC}/doc/* ${DOCSDIR}
.endif

.include <bsd.port.mk>
