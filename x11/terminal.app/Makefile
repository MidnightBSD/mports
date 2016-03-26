# $MidnightBSD$

PORTNAME=	terminal.app
PORTVERSION=	0.9.8
PORTREVISION=	2
CATEGORIES=	x11 gnustep
MASTER_SITES=	SAVANNAH/gap
DISTNAME=	Terminal-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Terminal Emulator for GNUstep

LICENSE=	gpl2

LICENSE=	gpl2 # only
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		gnustep
USE_GNUSTEP=	back build

post-install:
	${STRIP_CMD} ${PREFIX}/GNUstep/System/Applications/Terminal.app/Terminal

.include <bsd.port.mk>
