# $MidnightBSD$
# $FreeBSD: head/games/gnustep-sudoku/Makefile 383626 2015-04-09 07:44:41Z bapt $

PORTNAME=	sudoku
PORTVERSION=	0.7
CATEGORIES=	games gnustep
MASTER_SITES=	SAVANNAH/gap
PKGNAMEPREFIX=	gnustep-
DISTNAME=	Sudoku-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Sudoku solver and generator

LICENSE=	gpl3 # or later

USES=		gnustep
USE_GNUSTEP=	back build

post-install:
	${STRIP_CMD} ${PREFIX}/GNUstep/Local/Applications/Sudoku.app/Sudoku

.include <bsd.port.mk>
