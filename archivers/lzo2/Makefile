# $MidnightBSD: mports/archivers/lzo2/Makefile,v 1.5 2008/05/30 20:20:38 crash Exp $

PORTNAME=	lzo2
PORTVERSION=	2.03
PORTREVISION=	4
CATEGORIES=	archivers devel
MASTER_SITES=	http://www.oberhumer.com/opensource/lzo/download/ \
		http://fresh.t-systems-sfr.com/unix/src/misc/ \
		http://ftp.uni-koeln.de/util/arc/
MASTER_SITE_SUBDIR=	libs/compression
DISTNAME=	lzo-${DISTVERSIONPREFIX}${DISTVERSION}${DISTVERSIONSUFFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Portable speedy, lossless data compression library
LICENSE=	gpl2

USE_AUTOTOOLS=	libtool:22
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
