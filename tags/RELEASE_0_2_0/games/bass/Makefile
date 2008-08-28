# New ports collection makefile for: bass (Beneath a Steel Sky)
# Date created:        Tue Sep  2 23:34:32 BST 2003
# Whom:                Alex Trull <freebsd.alex@trull.org>
#
# $MidnightBSD: mports/games/bass/Makefile,v 1.2 2007/04/26 22:00:46 ctriv Exp $
# $FreeBSD: ports/games/bass/Makefile,v 1.8 2005/11/22 20:16:09 pav Exp $
#

PORTNAME=	bass
PORTVERSION=	1.2
PORTREVISION=	1
CATEGORIES=	games
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	scummvm
DISTNAME=	bass-cd-1.2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Beneath a Steel Sky: a post-apocalyptic futuristic graphical adventure
LICENSE=	other

RUN_DEPENDS=	scummvm:${PORTSDIR}/games/scummvm

USE_ZIP=	yes
NO_BUILD=	yes

WRKSRC=		${WRKDIR}/${DISTNAME}
SUB_FILES=	pkg-message

do-install:
	${MKDIR} ${DATADIR}
	${INSTALL_DATA} ${WRKSRC}/sky.dnr ${DATADIR}
	${INSTALL_DATA} ${WRKSRC}/sky.dsk ${DATADIR}
	${INSTALL_DATA} ${WRKSRC}/sky.cpt ${DATADIR}

.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
.for docs in readme.txt
	@${INSTALL_DATA} ${WRKSRC}/${docs} ${DOCSDIR}
.endfor
.endif


.include <bsd.port.mk>
