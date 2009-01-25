# New ports collection makefile for:    unrar
# Date created:         28 Dec 1994
# Whom:                 ache
#
# $MidnightBSD: mports/archivers/unrar/Makefile,v 1.5 2008/10/01 00:04:45 laffer1 Exp $
# $FreeBSD: ports/archivers/unrar/Makefile,v 1.46 2006/08/17 01:46:32 ache Exp $
#

PORTNAME=	unrar
PORTVERSION=	3.80
PORTEPOCH=	5
CATEGORIES+=	archivers
MASTER_SITES=	http://www.rarlab.com/rar/
DISTNAME=	unrarsrc-3.8.4

MAINTAINER?=	ports@MidnightBSD.org
COMMENT=	Extract, view & test RAR archives
LICENSE=	other

WRKSRC=		${WRKDIR}/unrar

USE_GMAKE=	yes

PLIST_FILES=	bin/unrar
PORTDOCS=	license.txt readme.txt

post-patch:
	@${SED} -e 's|g++|${CXX}|g' -e 's|-O2|${CXXFLAGS}|g' \
		${WRKSRC}/makefile.unix > ${WRKSRC}/Makefile

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/unrar ${PREFIX}/bin
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/license.txt ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/readme.txt ${DOCSDIR}
.endif

.include <bsd.port.mk>
