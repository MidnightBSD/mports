# $MidnightBSD: mports/sysutils/batmon/Makefile,v 1.4 2012/03/06 01:15:43 laffer1 Exp $

PORTNAME=	batmon
PORTVERSION=	0.6
CATEGORIES=	sysutils gnustep
MASTER_SITES=	${MASTER_SITE_SAVANNAH}
MASTER_SITE_SUBDIR=	gap

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNUstep battery monitor for laptops

LICENSE=	gpl2

USE_GNUSTEP=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes

post-patch:
	${REINPLACE_CMD} -e 's|^GNUSTEP_INSTALLATION_DIR|#GNUSTEP_INSTALLATION_DIR|' \
		${WRKSRC}/GNUmakefile

.include <bsd.port.mk>
