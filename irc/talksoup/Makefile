# $MidnightBSD$

PORTNAME=	talksoup
PORTVERSION=	1.1
PORTREVISION=	0
CATEGORIES=	irc gnustep
MASTER_SITES=	http://savannah.nongnu.org/download/gap/
DISTNAME=	TalkSoup-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	IRC client for GNUstep

LICENSE=	gpl2

LIB_DEPENDS+=	libnetclasses.so:net/netclasses

USES=		gnustep
USE_GNUSTEP=	back build

WRKSRC=		${WRKDIR}/${DISTNAME}
PLIST_SUB+=	APPVERSION=0.990

.include <bsd.port.mk>
