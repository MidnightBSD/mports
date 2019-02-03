# $MidnightBSD$

PORTNAME=	edenmath
PORTVERSION=	1.1.1
PORTREVISION=	2
CATEGORIES=	math gnustep
MASTER_SITES=	http://www.eskimo.com/~pburns/EdenMath/files/
DISTNAME=	EdenMath_GNUstep-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Scientific calcultor for GNUstep

LICENSE=	gpl2

USES=		gnustep
USE_GNUSTEP=	back build

post-patch:
	${REINPLACE_CMD} -e 's|^GNUSTEP_INSTALLATION_DIR|#GNUSTEP_INSTALLATION_DIR|' \
		${WRKSRC}/GNUmakefile

post-install:
	${STRIP_CMD} ${PREFIX}/GNUstep/System/Applications/EdenMath.app/EdenMath

.include <bsd.port.mk>
