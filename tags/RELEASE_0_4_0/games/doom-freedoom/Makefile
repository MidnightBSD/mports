# New ports collection makefile for:	doom-freedoom
# Date created:				23 November 2005
# Whom:					Alejandro Pulver <alejandro@varnet.biz>
#
# $MidnightBSD: mports/games/doom-freedoom/Makefile,v 1.2 2009/10/03 00:09:33 laffer1 Exp $
# $FreeBSD: ports/games/doom-freedoom/Makefile,v 1.7 2008/03/10 16:05:05 alepulver Exp $
#

PORTNAME=	freedoom
PORTVERSION=	0.7
CATEGORIES=	games
MASTER_SITES=	${MASTER_SITE_SAVANNAH}
MASTER_SITE_SUBDIR=	${PORTNAME}/${PORTNAME}-iwad
PKGNAMEPREFIX=	${DMPKGNAMEPREFIX}
DISTNAME=	${PORTNAME}-iwad-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Complete Doom-based game IWAD that is Free Software
LICENSE=	bsd3

USE_ZIP=	yes
NO_BUILD=	yes

DATADIR=	${DMDIR}/${PORTNAME}
DOCSDIR=	${PREFIX}/share/doc/${PKGNAMEPREFIX}${PORTNAME}

PORTDOCS=	ChangeLog NEWS README

do-install:
	@${MKDIR} ${PREFIX}/share/doom/freedom/
	@${INSTALL_DATA} ${WRKSRC}/doom2.wad ${PREFIX}/share/doom/freedom
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
.for f in ${PORTDOCS}
	@${INSTALL_DATA} ${WRKSRC}/${f} ${DOCSDIR}
.endfor
.endif

.include "${.CURDIR}/../doom-data/Makefile.include"

.include <bsd.port.mk>
