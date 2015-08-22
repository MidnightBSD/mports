# $MidnightBSD$

PORTNAME=	laternamagica
PORTVERSION=	0.4
CATEGORIES=	graphics gnustep
MASTER_SITES=	SAVANNAH/gap
DISTNAME=	LaternaMagica-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Image viewer and slideshow application

LICENSE=	gpl2 # or later

USES=		gnustep
USE_GNUSTEP=	back build

post-install:
	${STRIP_CMD} ${PREFIX}/GNUstep/Local/Applications/LaternaMagica.app/LaternaMagica

.include <bsd.port.mk>
