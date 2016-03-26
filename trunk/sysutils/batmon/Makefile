# $MidnightBSD$

PORTNAME=	batmon
PORTVERSION=	0.8
PORTREVISION=	1
CATEGORIES=	sysutils gnustep
MASTER_SITES=	SAVANNAH/gap

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNUstep battery monitor for laptops

LICENSE=	gpl2

USES=		gnustep
USE_GNUSTEP=	back build

post-patch:
	${REINPLACE_CMD} -e 's|^GNUSTEP_INSTALLATION_DIR|#GNUSTEP_INSTALLATION_DIR|' \
		${WRKSRC}/GNUmakefile

post-install:
	${STRIP_CMD} ${PREFIX}/GNUstep/Local/Applications/batmon.app/batmon

.include <bsd.port.mk>
