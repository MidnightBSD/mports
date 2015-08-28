# $MidnightBSD$
# $FreeBSD: head/deskutils/affiche/Makefile 389913 2015-06-17 12:55:29Z amdmi3 $

PORTNAME=	affiche
PORTVERSION=	0.6.0
CATEGORIES=	deskutils gnustep
MASTER_SITES=	http://www.collaboration-world.com/affiche.data/releases/Stable/
DISTNAME=	Affiche-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Affiche allows people to stick notes

LICENSE=	gpl2

USES=		gnustep
USE_GNUSTEP=	back build

WRKSRC=		${WRKDIR}/Affiche

post-install:
	${STRIP_CMD} ${PREFIX}/GNUstep/Local/Applications/Affiche.app/Affiche

.include <bsd.port.mk>
