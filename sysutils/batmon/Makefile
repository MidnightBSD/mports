# New ports collection makefile for:    batmon
#
# $MidnightBSD: mports/sysutils/batmon/Makefile,v 1.3 2011/06/04 15:13:34 laffer1 Exp $
# $FreeBSD: ports/sysutils/batmon/Makefile,v 1.6 2008/07/08 19:21:30 dinoex Exp $

PORTNAME=	batmon
PORTVERSION=	0.6
CATEGORIES=	sysutils gnustep
MASTER_SITES= ${MASTER_SITE_SAVANNAH}
MASTER_SITE_SUBDIR=   gap

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
