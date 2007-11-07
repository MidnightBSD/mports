# New ports collection makefile for:    timemon.app
# Date created:         28 Aug 2006
# Whom:                 gurkan@linuks.mine.nu
#
# $MidnightBSD: mports/sysutils/timemon/Makefile,v 1.2 2007/10/25 22:11:06 laffer1 Exp $
# $FreeBSD: ports/sysutils/timemon/Makefile,v 1.1 2006/09/07 05:38:19 dinoex Exp $
#

PORTNAME=	timemon
PORTVERSION=	4.0
PORTREVISION=	2
CATEGORIES=	sysutils gnustep
MASTER_SITES=	${MASTER_SITE_SAVANNAH}
MASTER_SITE_SUBDIR=	gap
DISTNAME=	TimeMon-gnustep
EXTRACT_SUFX=	.tgz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	CPU time usage monitor for GNUstep
LICENSE=	unknown

WRKSRC=		${WRKDIR}/TimeMon
USE_GMAKE=	yes
USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes

post-patch:
	${RM} ${WRKSRC}/shared_obj/*.*

.include <bsd.port.mk>
