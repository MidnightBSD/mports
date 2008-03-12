# New ports collection makefile for:	lzo
# Date created:				21 Feb 1998
# Whom:					giffunip@asme.org
#
# $MidnightBSD: mports/archivers/lzo/Makefile,v 1.2 2007/08/07 22:55:40 laffer1 Exp $
# $FreeBSD: ports/archivers/lzo/Makefile,v 1.35 2007/02/01 02:41:15 kris Exp $
#

PORTNAME=	lzo
PORTVERSION=	1.08
PORTEPOCH=	1
CATEGORIES=	archivers devel
MASTER_SITES=	http://www.oberhumer.com/opensource/lzo/download/LZO-v1/
MASTER_SITE_SUBDIR=	libs/compression

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Portable speedy, lossless data compression library
LICENSE=	gpl2

USE_AUTOTOOLS=	libtool:15
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
