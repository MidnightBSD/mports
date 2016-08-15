# $MidnightBSD$

PORTNAME=	localize
PORTVERSION=	0.0.1
PORTREVISION=	6
CATEGORIES=	textproc gnustep
MASTER_SITES=	http://www.eskimo.com/~pburns/Localize/files/
DISTNAME=	Localize-20040424

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Application to aid in the translation of .strings files

LICENSE=	gpl2

USES=		gnustep
USE_GNUSTEP=	back build

WRKSRC=		${WRKDIR}/Localize

post-install:
	@${STRIP_CMD} ${PREFIX}/GNUstep/System/Applications/Localize.app/Localize

.include <bsd.port.mk>
