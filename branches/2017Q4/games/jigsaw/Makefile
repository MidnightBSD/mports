# $FreeBSD: head/games/jigsaw/Makefile 383626 2015-04-09 07:44:41Z bapt $
# $MidnightBSD$

PORTNAME=	jigsaw
PORTVERSION=	0.8
PORTREVISION=	1
CATEGORIES=	games gnustep
MASTER_SITES=	SAVANNAH/gap
DISTNAME=	Jigsaw-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Simulates a jigsaw puzzle and illustrates the use of clipping paths

LICENSE=	gpl2

USES=		gnustep
USE_GNUSTEP=	back build

post-install:
	${STRIP_CMD} ${PREFIX}/GNUstep/System/Applications/Jigsaw.app/Jigsaw

.include <bsd.port.mk>
