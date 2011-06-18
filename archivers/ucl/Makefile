# $MidnightBSD$
# $FreeBSD: ports/archivers/ucl/Makefile,v 1.24 2010/12/04 07:30:16 ade Exp $

PORTNAME=	ucl
PORTVERSION=	1.03
CATEGORIES=	archivers devel
MASTER_SITES=	http://www.oberhumer.com/opensource/ucl/download/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A data compression library with low memory usage
LICENSE=	gpl2

USE_AUTOTOOLS=	libtool
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--enable-shared

PORTDOCS=	AUTHORS NEWS README THANKS TODO

post-install:
	${INSTALL_PROGRAM} ${WRKSRC}/examples/.libs/uclpack ${PREFIX}/bin
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	cd ${WRKSRC} && ${INSTALL_DATA}	${PORTDOCS} ${DOCSDIR}
.endif

.include <bsd.port.mk>
