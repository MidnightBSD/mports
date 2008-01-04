# ex:ts=8
# Ports collection makefile for:	cvsps
# Date Created:			Jan 4, 2008
# Whom:				laffer1
#
# $MidnightBSD$
#

PORTNAME=	cvsps
PORTVERSION=	2.1
PORTREVISION=	0
CATEGORIES=	devel
MASTER_SITES=	http://www.cobite.com/cvsps/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Create patchset information from CVS
LICENSE=	gpl2

USE_GMAKE=	yes
ALL_TARGET=	cvsps

MAN1=		cvsps.1
PLIST_FILES=	bin/cvsps

.if !defined(NOPORTDOCS)
PORTDOCS=	README
.endif

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/cvsps ${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/cvsps.1 ${MANPREFIX}/man/man1

.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/README ${DOCSDIR}
.endif

.include <bsd.port.mk>
