# $MidnightBSD: mports/archivers/lzo2/Makefile,v 1.6 2009/09/19 23:47:02 laffer1 Exp $

PORTNAME=	lzo2
PORTVERSION=	2.03
PORTREVISION=	5
CATEGORIES=	archivers devel
MASTER_SITES=	http://www.oberhumer.com/opensource/lzo/download/ \
		http://fresh.t-systems-sfr.com/unix/src/misc/ \
		http://ftp.uni-koeln.de/util/arc/
MASTER_SITE_SUBDIR=	libs/compression
DISTNAME=	lzo-${DISTVERSIONPREFIX}${DISTVERSION}${DISTVERSIONSUFFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Portable speedy, lossless data compression library
LICENSE=	gpl2

USE_AUTOTOOLS=	libtool
GNU_CONFIGURE=  yes
CONFIGURE_TARGET=	--build=${ARCH}-portbld-freebsd6.1
CONFIGURE_ARGS=	--enable-shared
USE_LDCONFIG=	yes

post-install:
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA}	${WRKSRC}/doc/* ${DOCSDIR}
.endif

.include <bsd.port.mk>
