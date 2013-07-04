# $MidnightBSD: mports/games/bass/Makefile,v 1.4 2009/03/30 22:55:39 laffer1 Exp $

PORTNAME=	bass
PORTVERSION=	1.2
PORTREVISION=	2
CATEGORIES=	games
MASTER_SITES=	SF/scummvm/extras/Beneath%20a%20Steel%20Sky
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
