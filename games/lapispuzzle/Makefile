# Created by: gurkan@phys.ethz.ch
# $FreeBSD: head/games/lapispuzzle/Makefile 383626 2015-04-09 07:44:41Z bapt $
# $MidnightBSD$

PORTNAME=	lapispuzzle
PORTVERSION=	1.2
CATEGORIES=	games gnustep
MASTER_SITES=	SAVANNAH/gap
DISTNAME=	LapisPuzzle-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tetris-like game for GNUstep

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		gnustep
USE_GNUSTEP=	back build

WRKSRC=		${WRKDIR}/LapisPuzzle-${PORTVERSION}

post-install:
	${STRIP_CMD} ${PREFIX}/GNUstep/Local/Applications/LapisPuzzle.app/LapisPuzzle

.include <bsd.port.mk>
