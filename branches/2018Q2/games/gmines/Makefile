# $MidnightBSD$
# $FreeBSD: head/games/gmines/Makefile 383626 2015-04-09 07:44:41Z bapt $

PORTNAME=	gmines
PORTVERSION=	0.2
PORTREVISION=	1
CATEGORIES=	games gnustep
MASTER_SITES=	SAVANNAH/gap
DISTNAME=	GMines-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Well-known minesweeper game for GNUstep

LICENSE=	gpl2 # or later

USES=		gnustep
USE_GNUSTEP=	back build

post-install:
	${STRIP_CMD} ${PREFIX}/GNUstep/System/Applications/GMines.app/GMines

.include <bsd.port.mk>
