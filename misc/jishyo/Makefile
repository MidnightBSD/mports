PORTNAME=	jishyo
PORTVERSION=	0.1
PORTREVISION=	3
CATEGORIES=	misc japanese gnustep
MASTER_SITES=	http://www.eskimo.com/~pburns/Dictionaries/files/
DISTNAME=	Jishyo-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	English to Japanese dictionary for GNUstep
WWW=		https://www.eskimo.com/~pburns/Dictionaries/

LICENSE=	gpl2

USES=		gnustep
USE_GNUSTEP=	back build

WRKSRC=	${WRKDIR}/${DISTNAME}

PORTSCOUT=	skipv:0.2

post-install:
	${STRIP_CMD} ${PREFIX}/GNUstep/System/Applications/Jishyo.app/Jishyo

.include <bsd.port.mk>
