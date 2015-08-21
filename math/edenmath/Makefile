# $MidnightBSD$

PORTNAME=	edenmath
PORTVERSION=	1.1.1
PORTREVISION=	1
CATEGORIES=	math gnustep
MASTER_SITES=	http://www.eskimo.com/~pburns/EdenMath/files/
DISTNAME=	EdenMath_GNUstep-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Scientific calcualtor for GNUstep

LICENSE=	gpl2

USES=		gnustep
USE_GNUSTEP=	back build

post-patch:
	${REINPLACE_CMD} -e 's|^GNUSTEP_INSTALLATION_DIR|#GNUSTEP_INSTALLATION_DIR|' \
		${WRKSRC}/GNUmakefile

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/GNUstep/Local/Applications/EdenMath.app/EdenMath

.include <bsd.port.mk>
