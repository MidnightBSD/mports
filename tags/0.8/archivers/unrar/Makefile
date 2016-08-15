# New ports collection makefile for:    unrar
# Date created:         28 Dec 1994
# Whom:                 ache
#
# $MidnightBSD$
# $FreeBSD: ports/archivers/unrar/Makefile,v 1.46 2006/08/17 01:46:32 ache Exp $
#

PORTNAME=	unrar
PORTVERSION=	4.20
PORTREVISION=	0
PORTEPOCH=	5
CATEGORIES+=	archivers
MASTER_SITES=	http://www.rarlab.com/rar/ \
		LOCAL/sunpoet
DISTNAME=	unrarsrc-4.2.4

MAINTAINER?=	ports@MidnightBSD.org
COMMENT=	Extract, view & test RAR archives
LICENSE=	other

WRKSRC=		${WRKDIR}/unrar

USE_GMAKE=	yes
MAKEFILE=	makefile.unix

PLIST_FILES=	bin/unrar
PORTDOCS=	license.txt readme.txt

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/unrar ${PREFIX}/bin
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/license.txt ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/readme.txt ${DOCSDIR}
.endif

.include <bsd.port.mk>
