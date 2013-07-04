# $MidnightBSD: mports/mbone/wb/Makefile,v 1.1 2007/04/05 00:41:04 laffer1 Exp $

PORTNAME=	wb
PORTVERSION=	1.59
CATEGORIES=	mbone
MASTER_SITES=	ftp://ftp.ee.lbl.gov/conferencing/wb/
DISTFILES=	i386-wb-1.59.tar.Z

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A shared drawing (whiteboard) tool using multicast
LICENSE=	unknown

NO_WRKSUBDIR=	yes
NO_BUILD=	yes
STRIP=

USE_GHOSTSCRIPT_RUN=	yes

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/wb ${PREFIX}/bin
.if !defined(NOPORTDOCS)
	${MKDIR} ${PREFIX}/share/doc/wb
	${INSTALL_DATA} ${WRKSRC}/README ${PREFIX}/share/doc/wb
	${INSTALL_DATA} ${WRKSRC}/CHANGES ${PREFIX}/share/doc/wb
	${INSTALL_DATA} ${WRKSRC}/NOTES ${PREFIX}/share/doc/wb
	${INSTALL_DATA} ${WRKSRC}/lblwb.ps ${PREFIX}/share/doc/wb
.endif

.include <bsd.port.mk>
