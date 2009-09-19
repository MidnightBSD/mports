# $MidnightBSD: mports/archivers/lzo/Makefile,v 1.3 2008/03/12 01:45:57 laffer1 Exp $

PORTNAME=	lzo
PORTVERSION=	1.08
PORTREVISION=	1
PORTEPOCH=	1
CATEGORIES=	archivers devel
MASTER_SITES=	http://www.oberhumer.com/opensource/lzo/download/LZO-v1/
MASTER_SITE_SUBDIR=	libs/compression

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Portable speedy, lossless data compression library
LICENSE=	gpl2

USE_AUTOTOOLS=	libtool:22
GNU_CONFIGURE=  yes
CONFIGURE_TARGET=	--build=${ARCH}-portbld-freebsd6.0
CONFIGURE_ARGS=	--enable-shared
USE_LDCONFIG=	yes

post-install:
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA}	${WRKSRC}/doc/* ${DOCSDIR}
.endif

.include <bsd.port.mk>
