# $MidnightBSD$

PORTNAME=	timemon
PORTVERSION=	4.1
PORTREVISION=	2
CATEGORIES=	sysutils gnustep
MASTER_SITES=	SAVANNAH/gap
DISTNAME=	TimeMon-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	CPU time usage monitor for GNUstep

LICENSE=	unknown

NO_CDROM=	distribute without fee

USES=		gnustep
USE_GNUSTEP=	back build

post-patch:
	${RM} ${WRKSRC}/shared_obj/*.*

post-install:
	${STRIP_CMD} ${PREFIX}/GNUstep/Local/Applications/TimeMon.app/TimeMon

.include <bsd.port.mk>
